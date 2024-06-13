<?php

namespace Modules\Device\Entities;

use App\Models\BaseModel;
use Modules\Category\Entities\Model as Category;
use Modules\Specs\Entities\Model as Specs;
use Modules\Type\Entities\Model as Type;
use Modules\Brand\Entities\Model as Brand;

class Device extends BaseModel
{
    protected $guarded = [];

    protected $table = 'devices';

    public function Items()
    {
        return $this->hasMany(DeviceItem::class, 'device_id');
    }

    public function Specs()
    {
        return $this->belongsToMany(Specs::class, 'device_specs', 'device_id', 'specs_id')->withPivot('desc_ar', 'desc_en');
    }

    public function Accessories()
    {
        return $this->belongsToMany(self::class, 'device_accessory', 'device_id', 'accessory_id');
    }

    public function Brand()
    {
        return $this->belongsTo(Brand::class, 'brand_id');
    }

    public function Categories()
    {
        return $this->belongsToMany(Category::class, 'device_category', 'device_id', 'category_id');
    }

    public function Features()
    {
        return $this->hasMany(Feature::class);
    }

    public function Gallery()
    {
        return $this->hasMany(Gallery::class);
    }
    
    public function Headers()
    {
        return $this->hasMany(Header::class);
    }

    public function types()
    {
        return $this->belongsToMany(Type::class,'device_types','device_id','type_id');
    }












    // for website (client)
    public function Price()
    {
        return format_number($this->price * Country()->currancy_value);
    }
    public function RealPrice()
    {
        if ($this->discount_value && $this->discount_from < now() && $this->discount_to > now()) {
            return format_number(($this->price - ($this->price / 100 * $this->discount_value)) * Country()->currancy_value);
        } else {
            return format_number($this->price * Country()->currancy_value);
        }
    }
    public function PriceWithCurrancy()
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
    public function CalcPriceWithCurrancy()
    {
        if ($this->discount_value && $this->discount_from < now() && $this->discount_to > now()) {
            return format_number(($this->price - ($this->price / 100 * $this->discount_value)) * Country()->currancy_value).' '.Country()->currancy_code;
        } else {
            return format_number($this->price * Country()->currancy_value).' '.Country()->currancy_code;
        }
    }
    public function scopeHasDiscount($query)
    {
        return $query->where('discount_value', '>', 0)->where('discount_from', '<', now())->where('discount_to', '>', now());
    }
    public function HasDiscount()
    {
        return $this->discount_value && $this->discount_from < now() && $this->discount_to > now();
    }



    // for dashboard (admin)
    public function PriceMain()
    {
        return format_number($this->price);
    }

    public function CalcPriceWithCurrancyMain()
    {
        if ($this->discount_value && $this->discount_from < now() && $this->discount_to > now()) {
            return format_number(($this->price - ($this->price / 100 * $this->discount_value)) ).' '.MainCountry()->currancy_code;
        } else {
            return format_number($this->price ).' '.MainCountry()->currancy_code;
        }
    }

}
