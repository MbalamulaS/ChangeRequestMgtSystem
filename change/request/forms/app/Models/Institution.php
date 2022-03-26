<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Institution extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'inst_name',
        'vote_code',
        'sub_vote_no',
        'vote_name',
        'sub_vote_name',
        'created_by',
        'updated_by',
        'deleted_by',
        'status',
        'created_at',
        'updated_at',
    ];
    protected $dates = ['deleted_at'];
  
}
