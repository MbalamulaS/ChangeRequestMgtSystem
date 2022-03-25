<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Rolespermission extends Model
{
    use HasFactory;
    use SoftDeletes;
    
    protected $fillable = [
        'role_id',
        'permission_id',
        'enabled',
        'created_by',
        'updated_by',
        'deleted_by',
        'status',
        'created_at',
        'updated_at',
    ];
    protected $dates = ['deleted_at'];

    public function permission(){
        return $this->belongsTo(Permission::class);
    }

    public function role(){
        return $this->belongsTo(Role::class);
    }
}
