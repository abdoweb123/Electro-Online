<?php

namespace App\Models;


use Modules\TypeItem\Entities\Model as TypeItem;

class CartTypeItem extends BaseModel
{
    protected $guarded = [];

    protected $table = 'cart_type_items';

    public function typeItem()
    {
        return $this->belongsToMany(TypeItem::class,'cart_type_items','cart_id','type_item_id');
    }

}
