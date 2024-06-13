<?php

namespace App\Livewire;

use PDF;
use App\Models\Cart;
use Modules\Office\Entities\Model as Office;
use Modules\Protection\Entities\Model as Protection;
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
    
    
    public $step = 1;
    public $last_step = 2;
    
    public $SelectedAccessories = [];
    
    
    public function mount($Device)
    {
        $this->Office = Office::active()->get();
        $this->Protection = Protection::active()->get();
        $this->Device = $Device;
        
        if($this->Device->Accessories->count()){
            $this->last_step = 3;
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
        Cart::insert([
            'client_id' => client_id(),
            'device_id' => $this->Device->id,
            'color_id' => $this->SelectedColor,
            'item_id' => $this->SelectedSpecification,
            'office_id' => $this->SelectedOfficeItem,
            'protection_id' => $this->SelectedProtectionItem,
            'quantity' => 1,
            'created_at' => now(),
        ]);
        
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
        if (count($this->Device->Items) > 0){

        }


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


        $this->SelectedSize = $this->SelectedItem->size_id;
        $this->SelectedColor = $this->SelectedItem->color_id;
        $this->SelectedSpecification = $this->SelectedItem->id;


        $this->Sizes = $this->Device->Items->unique('size_id');
        $this->Colors = $this->Device->Items->where('size_id',$this->SelectedSize)->unique('color_id');
        $this->Specifications = $this->Device->Items->where('size_id',$this->SelectedSize)->where('color_id',$this->SelectedColor);
    }

    public function next()
    {
        $this->step += 1;
    }

    public function change_step($step)
    {
        $this->step  = $step;
    }

    public function SelectOfficeItem($id)
    {
        $this->SelectedOfficeItem  = $id;
    }

    public function SelectProtectionItem($id)
    {
        $this->SelectedProtectionItem  = $id;
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
