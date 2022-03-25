<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Mnrtsystem extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable = [
        'mnrtsystem_name',
    ];
    protected $dates = ['deleted_at'];
}
