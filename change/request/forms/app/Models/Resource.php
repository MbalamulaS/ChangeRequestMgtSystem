<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Resource extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'activity_id',
        'gfs_id',
        'unit_cost',
        'unit_count',
        'day',
        'created_by',
        'updated_by',
        'deleted_by',
        'status',
        'created_at',
        'updated_at',
    ];
    protected $dates = ['deleted_at'];

    public function activity(){
        return $this->belongsTo(Activity::class);
    }

}
