<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Changerequest extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable = [
        'request_type',
        'request_desc',
        'priority',
        'deadline',
        'reason',
        'inst_approval',
        'inst_comment',
        'mnrt_approval',
        'mnrt_comment',
        'condition',
        'institution_id',
        'mnrtsystem_id',
        'created_by',
        'updated_by',
        'deleted_by',
        'status',
    ];
    protected $dates = ['deleted_at'];

    public function user(){
        return $this->belongsTo(User::class, 'created_by');
    }
    public function institution(){
        return $this->belongsTo(Institution::class, 'institution_id');
    }
    public function mnrtsystem(){
        return $this->belongsTo(Mnrtsystem::class, 'mnrtsystem_id');
    }
    public function requestcategory(){
        return $this->belongsTo(Requestcategory::class, 'request_type');
    }
    public function priority(){
        return $this->belongsTo(Priority::class, 'priority');
    }
}
