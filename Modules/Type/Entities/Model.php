<?php

namespace Modules\Type\Entities;

use App\Models\BaseModel;
use Modules\TypeItem\Entities\Model as TypeItem;

class Model extends BaseModel
{
    protected $guarded = [];

    protected $table = 'types';

    public function typeItems()
    {
        return $this->hasMany(TypeItem::class, 'type_id');
    }




}
