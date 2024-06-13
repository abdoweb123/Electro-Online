<?php

namespace App\Livewire;

use App\Models\CartTypeItem;
use PDF;
use App\Models\Cart;
use Livewire\Component;
use Illuminate\Support\Facades\DB;

class Build extends Component
{
    public $Device = NULL;
    public $Office = NULL;
    public $Protection = NULL;

    public $Sizes = NULL;
    public $Colors = NULL;
    public $Specifications = NULL;

    public $SelectedItem = NULL;

    public $SelectedSize = NULL;
    public $SelectedColor = NULL;
    public $SelectedSpecification = NULL;


    public $SelectedOfficeItem = NULL;
    public $SelectedProtectionItem = NULL;
    public $selectedTypeItems = [];



    public $step = 1;
    public $last_step = 2;

    public $SelectedAccessories = [];


    public function mount($Device)
    {
        $this->Device = $Device;

        if($this->Device->Accessories->count()){
            $this->last_step = 3;
        }

        if(!$this->Device->Items->count()){
            $this->step = 2;
        }

        $this->SetData();
    }

    public function render()
    {
        return view('Client.layouts.build');
    }

    public function ChangeSelectedSize($val)
    {
        $this->SetData($val);
    }
    public function ChangeSelectedColor($val)
    {
        $this->SetData($this->SelectedSize,$val);
    }

    public function ChangeSpecification($val)
    {
        $this->SelectedSpecification = $val;
        $this->SetData($this->SelectedSize,$this->SelectedColor,$val);
    }

    public function AddToCart()
    {
        $cart =  Cart::create([
                    'client_id' => client_id(),
                    'device_id' => $this->Device->id,
                    'color_id' => $this->SelectedColor,
                    'item_id' => $this->SelectedSpecification,
                    'quantity' => 1,
                    'created_at' => now(),
                 ]);

        if ($cart) {
            if (count($this->selectedTypeItems)){
                foreach ($this->selectedTypeItems as $selectedTypeItem){
                    CartTypeItem::insert([
                        'client_id' => client_id(),
                        'cart_id' => $cart->id,
                        'type_item_id' => $selectedTypeItem,
                        'created_at' => now(),
                    ]);
                }
            }
        }


        foreach($this->Device->Accessories->whereIn('id',(array)$this->SelectedAccessories) as $Accessory){
            Cart::insert([
                'client_id' => client_id(),
                'device_id' => $Accessory->id,
                'quantity' => 1,
                'created_at' => now(),
            ]);
        }
        return redirect()->route('Client.cart');
    }

    public function SetData($size_id = NULL,$color_id = NULL,$specification_id = NULL)
    {
        $this->SelectedItem = $this->Device->Items
            ->when($size_id, function ($query) use($size_id) {
                return $query->where('size_id', $size_id);
            })
            ->when($color_id, function ($query) use($color_id) {
                return $query->where('color_id', $color_id);
            })
            ->when($specification_id, function ($query) use($specification_id) {
                return $query->where('id', $specification_id);
            })
            ->first();

        if ($this->SelectedItem) {
            $this->SelectedSize = $this->SelectedItem->size_id;
            $this->SelectedColor = $this->SelectedItem->color_id;
            $this->SelectedSpecification = $this->SelectedItem->id;

            $this->Sizes = $this->Device->Items->unique('size_id');
            $this->Colors = $this->Device->Items->where('size_id',$this->SelectedSize)->unique('color_id');
            $this->Specifications = $this->Device->Items->where('size_id',$this->SelectedSize)->where('color_id',$this->SelectedColor);
        } else {
            $this->step = 2;
            return;
        }
    }

    public function next()
    {
        $this->step += 1;
    }

    public function change_step($step)
    {
        $this->step  = $step;
    }


    public function SelectTypeItem($typeId, $typeItemId)
    {
        if (isset($this->selectedTypeItems[$typeId]) && $this->selectedTypeItems[$typeId] == $typeItemId) {
            unset($this->selectedTypeItems[$typeId]);
        } else {
            $this->selectedTypeItems[$typeId] = $typeItemId;
        }
    }


    public function SelectAccessories($id)
    {
        if (($key = array_search($id, $this->SelectedAccessories)) !== false) {
            unset($this->SelectedAccessories[$key]);
        }else{
            $this->SelectedAccessories[] = $id;
        }

    }
}
