<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Blog extends Model
{
    use HasFactory, SoftDeletes;

    protected $guarded = [];

    public function createdBy()
    {
        return $this->hasOne(User::class, 'id', 'created_by');
    }

    protected $appends = [
        'formatted_created_at',
    ];

    public function getFormattedCreatedAtAttribute()
    {
        // return $this->created_at->format('d, M Y | h:i A');
        return $this->created_at->diffForHumans();
    }
}
