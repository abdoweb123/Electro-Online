<?php

namespace App\Traits;

trait Status
{
    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function scopeDisActive($query)
    {
        return $query->where('status', 0);
    }

    public function scopeActiveBrand($query)
    {
        return $query->where(function ($q) {
            $q->whereHas('Brand', function ($q) {
                $q->where('status', 1);
            })->orWhereDoesntHave('Brand');
        });
    }

}
