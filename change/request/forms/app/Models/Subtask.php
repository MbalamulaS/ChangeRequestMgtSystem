<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Subtask extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'subtask_desc',
        'maintask_id',
        'created_by',
        'updated_by',
        'deleted_by',
        'status',
        'created_at',
        'updated_at',
    ];
    protected $dates = ['deleted_at'];

    public function maintask(){
        return $this->belongsTo(Maintask::class);
    }
}
