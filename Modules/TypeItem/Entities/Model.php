<?php

namespace Modules\TypeItem\Entities;

use App\Models\BaseModel;
use App\Models\Cart;
use Modules\Type\Entities\Model as Type;

class Model extends BaseModel
{
    protected $guarded = [];

    protected $table = 'type_items';


    /*** start relations ***/
    public function type()
    {
        return $this->belongsTo(Type::class,'type_id');
    }


    public function cart()
    {
        return $this->belongsToMany(Cart::class,'cart_type_items','type_item_id','cart_id');
    }
    /*** end relations ***/





    public function CalcPriceWithCurrancy()
    {
        if ($this->discount_value && $this->discount_from < now() && $this->discount_to > now()) {
            return format_number(($this->price - ($this->price / 100 * $this->discount_value)) * Country()->currancy_value).' '.Country()->currancy_code;
        } else {
            return format_number($this->price * Country()->currancy_value).' '.Country()->currancy_code;
        }
    }

    public function CalcPrice()
    {
        if ($this->discount_value && $this->discount_from < now() && $this->discount_to > now()) {
            return format_number(($this->price - ($this->price / 100 * $this->discount_value)) * Country()->currancy_value);
        } else {
            return format_number($this->price * Country()->currancy_value);
        }
    }

} //end of class
