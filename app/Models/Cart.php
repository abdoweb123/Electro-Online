<?php

namespace App\Models;

use Modules\Color\Entities\Model as Color;
use Modules\Protection\Entities\Model as Protection;
use Modules\Office\Entities\Model as Office;
use Modules\TypeItem\Entities\Model as TypeItem;
use Modules\Device\Entities\Device;

class Cart extends BaseModel
{
    protected $guarded = [];

    protected $table = 'cart';

    public function Device()
    {
        return $this->belongsTo(Device::class);
    }

    public function Color()
    {
        return $this->belongsTo(Color::class);
    }

    public function typeItem()
    {
        return $this->belongsToMany(TypeItem::class,'cart_type_items','cart_id','type_item_id');
    }

} //end of class
