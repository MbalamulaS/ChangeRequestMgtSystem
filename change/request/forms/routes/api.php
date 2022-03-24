<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\InstitutionController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\OjectiveController;
use App\Http\Controllers\ResetPwdReqController;
use App\Http\Controllers\UpdatePwdController;
use App\Http\Controllers\TargetController;
use App\Http\Controllers\ActivityController;
use App\Http\Controllers\MaintaskController;
use App\Http\Controllers\SubtaskController;
use App\Http\Controllers\GfsController;
use App\Http\Controllers\MilestoneController;
use App\Http\Controllers\ViewActivityByInstitutionIdController;
use App\Http\Controllers\ActivityprogressController;
use App\Http\Controllers\ViewActivityProgressMilestoneController;
use App\Http\Controllers\ResourceController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\RolespermissionController;
use App\Http\Controllers\ActivityprogressLogController;
use App\Http\Controllers\AttachmentController;
use App\Http\Controllers\FunddisbursementController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\ViewFunddisbursementMilestoneController;
use App\Http\Controllers\IndicatorController;
use App\Http\Controllers\ViewReportActivitySummaryController;
use App\Http\Controllers\ContractController;
use App\Http\Controllers\ContractProgressController;
use App\Http\Controllers\ContractattachmentController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ChangepassworController;
use App\Http\Controllers\CsvController;
use App\Http\Controllers\ContractorController;
use App\Http\Controllers\ViewContractTotalAmountDisbursedController;
use App\Http\Controllers\ViewReportContractsSummaryController;
use App\Http\Controllers\ViewContractsByInstitutionIdController;
use App\Http\Controllers\ChangerequestController;
use App\Http\Controllers\MnrtsystemController;
use App\Http\Controllers\RequestcategoryController;
use App\Http\Controllers\PriorityController;



use App\Model\User;
use App\Model\Institution;
use App\Model\Role;
use App\Model\Objective;
use App\Model\Target;
use App\Model\Activity;
use App\Model\Maintask;
use App\Model\Subtask;
use App\Model\Gfs;
use App\Model\Milestone;
use App\Model\ViewActivityByInstitutionId;
use App\Model\Activityprogress;
use App\Model\ViewActivityProgressMilestone;
use App\Model\Resource;
use App\Model\Permission;
use App\Model\Rolespermission;
use App\Model\ActivityprogressLog;
use App\Model\Attachment;
use App\Model\Funddisbursement;
use App\Model\Document;
use App\Model\ViewFunddisbursementMilestone;
use App\Model\Indicator;
use App\Model\ViewReportActivitySummary;
use App\Model\Contract;
use App\Model\ContractProgress;
use App\Model\Contractattachment;
use App\Model\Contractor;
use App\Model\ViewContractTotalAmountDisbursed;
use App\Model\ViewReportContractsSummary;
use App\Model\ViewContractsByInstitutionId;
use App\Model\Changerequest;
use App\Model\Mnrtsystem;
use App\Model\Requestcategory;
use App\Model\Prioritycategory;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


//**NOT AUTHENTICATION WITH JSON WEB TOKE (JWT) API*
// Login api router
Route::post('login',[UserController::class,"login"]);

// Forgotten password reset request && forgetten password updating 
Route::post('/req-password-reset', [ResetPwdReqController::class, 'reqForgotPassword']);
Route::post('/update-password', [UpdatePwdController::class, 'updatePassword']);
//
//
//

//
//

//**AUTHENTICATION WITH JSON WEB TOKE (JWT) APIs**

Route::group(['middleware' => ['jwt.verify']], function() {
Route::post('/register', [UserController::class, "register"]);
Route::get('/users', [UserController::class, 'index']);
Route::get('/user/{id}', [UserController::class, 'show']);
Route::get('/user', 'App\Http\Controllers\UserController@list');

    // Institution api router
Route::get('/institutions', [InstitutionController::class, 'index']);
Route::get('/institution/{id}', [InstitutionController::class, 'show']);
Route::post('/insertInstitution', [InstitutionController::class, 'store']);
Route::put('/updateInstitution/{id}', [InstitutionController::class, 'update']);
Route::delete('/deleteInstitution/{id}', [InstitutionController::class, 'destroy']);


//On demand user Password api router
//Route::post('/change-password', [ChangepassworController::class, 'changePasswordPost']);
Route::post('/change-password', 'App\Http\Controllers\ChangepassworController@changePasswordPost')->name('change-password');


// Milestone api router
Route::get('/milestones', [MilestoneController::class, 'index']);
Route::get('/milestone/{id}', [MilestoneController::class, 'show']);
Route::post('/insertMilestone', [MilestoneController::class, 'store']);
Route::put('/updateMilestone/{id}', [MilestoneController::class, 'update']);
Route::delete('/deleteMilestone/{id}', [MilestoneController::class, 'destroy']);

// Activityprogress api router
Route::get('/activityprogresss', [ActivityprogressController::class, 'index']);
Route::get('/activityprogress/{id}', [ActivityprogressController::class, 'show']);
Route::post('/insertActivityprogress', [ActivityprogressController::class, 'store']);
Route::put('/updateActivityprogress/{id}', [ActivityprogressController::class, 'update']);
Route::post('/update-actual-target/{id}', [ActivityprogressController::class, 'updates']);
Route::delete('/deleteActivityprogress/{id}', [ActivityprogressController::class, 'destroy']);
Route::post('/update-activity-prog-1-level/{id}', 'App\Http\Controllers\ActivityprogressController@updateslevel1');
Route::post('/update-activity-prog-2-level/{id}', 'App\Http\Controllers\ActivityprogressController@updatez');
Route::post('/update-activity-prog-3-level/{id}', 'App\Http\Controllers\ActivityprogressController@updating');

// Role api router
Route::get('/roles', [RoleController::class, 'index']);
Route::get('/role/{id}', [RoleController::class, 'show']);
Route::post('/insertRole', [RoleController::class, 'store']);
Route::put('/updateRole/{id}', [RoleController::class, 'update']);
Route::delete('/deleteRole/{id}', [RoleController::class, 'destroy']);

// Objective api router
//Route::get('/objectives', [ObjectiveController::class, 'index']);
Route::get('/objectives', 'App\Http\Controllers\ObjectiveController@index');
Route::get('/objective/{id}', 'App\Http\Controllers\ObjectiveController@show');
Route::post('/insertObjective', 'App\Http\Controllers\ObjectiveController@store');
Route::put('/updateObjective/{id}', 'App\Http\Controllers\ObjectiveController@update');
Route::delete('/deleteObjective/{id}', 'App\Http\Controllers\ObjectiveController@destroy');
Route::get('/objectives', 'App\Http\Controllers\ObjectiveController@list');

// Target api router
Route::get('/targets', 'App\Http\Controllers\TargetController@index');
Route::get('/target/{id}', 'App\Http\Controllers\TargetController@show');
Route::post('/insertTarget', 'App\Http\Controllers\TargetController@store');
Route::put('/updateTarget/{id}', 'App\Http\Controllers\TargetController@update');
Route::delete('/deleteTarget/{id}', 'App\Http\Controllers\TargetController@destroy');
Route::get('/targets', 'App\Http\Controllers\TargetController@list');

// Activity api router
Route::get('/activities', 'App\Http\Controllers\ActivityController@index');
Route::get('/activity/{id}', 'App\Http\Controllers\ActivityController@show');
Route::post('/insertActivity', 'App\Http\Controllers\ActivityController@store');
Route::post('/activities/{id}', 'App\Http\Controllers\ActivityController@updatez');
Route::put('/updateActivity/{id}', 'App\Http\Controllers\ActivityController@update');
Route::delete('/deleteActivity/{id}', 'App\Http\Controllers\ActivityController@destroy');
Route::get('/activities', 'App\Http\Controllers\ActivityController@list');
Route::get('/view-activity-institution', 'App\Http\Controllers\ActivityController@virtual');


// Maintask api router
Route::get('/maintasks', 'App\Http\Controllers\MaintaskController@index');
Route::get('/maintask/{id}', 'App\Http\Controllers\MaintaskController@show');
Route::post('/insertMaintask', 'App\Http\Controllers\MaintaskController@store');
Route::put('/updateMaintask/{id}', 'App\Http\Controllers\MaintaskController@update');
Route::delete('/deleteMaintask/{id}', 'App\Http\Controllers\MaintaskController@destroy');
Route::get('/maintasks', 'App\Http\Controllers\MaintaskController@list');

// Subtask api router
Route::get('/subtasks', 'App\Http\Controllers\SubtaskController@index');
Route::get('/subtask/{id}', 'App\Http\Controllers\SubtaskController@show');
Route::post('/insertSubtask', 'App\Http\Controllers\SubtaskController@store');
Route::put('/updateSubtask/{id}', 'App\Http\Controllers\SubtaskController@update');
Route::delete('/deleteSubtask/{id}', 'App\Http\Controllers\SubtaskController@destroy');
Route::get('/subtasks', 'App\Http\Controllers\SubtaskController@list');

// Gfs api router
Route::get('/gfs', 'App\Http\Controllers\GfsController@index');
Route::get('/gfs/{id}', 'App\Http\Controllers\GfsController@show');
Route::post('/insertGfs', 'App\Http\Controllers\GfsController@store');
Route::put('/updateGfs/{id}', 'App\Http\Controllers\GfsController@update');
Route::post('/updateGfs/{id}', 'App\Http\Controllers\GfsController@updates');
Route::delete('/deleteGfs/{id}', 'App\Http\Controllers\GfsController@destroy');
Route::put('/update-gfs/{id}', 'App\Http\Controllers\GfsController@updatez');





// Resource api router
//Route::get('/resources', [ResourceController::class, 'index']);
Route::get('/resources', 'App\Http\Controllers\ResourceController@index');
Route::get('/resource/{id}', 'App\Http\Controllers\ResourceController@show');
Route::post('/insertResource', 'App\Http\Controllers\ResourceController@store');
Route::put('/updateResource/{id}', 'App\Http\Controllers\ResourceController@update');
Route::delete('/deleteResource/{id}', 'App\Http\Controllers\ResourceController@destroy');
Route::get('/resources', 'App\Http\Controllers\ResourceController@list');

// Permission api router
Route::get('/permissions', 'App\Http\Controllers\PermissionController@index');
Route::get('/permission/{id}', 'App\Http\Controllers\PermissionController@show');
Route::post('/insertPermission', 'App\Http\Controllers\PermissionController@store');
Route::put('/updatePermission/{id}', 'App\Http\Controllers\PermissionController@update');
Route::delete('/deletePermission/{id}', 'App\Http\Controllers\PermissionController@destroy');


// Rolespermission api router
Route::get('/rolespermissions', 'App\Http\Controllers\RolespermissionController@index');
Route::get('/rolespermission/{id}', 'App\Http\Controllers\RolespermissionController@show');
Route::post('/insertRolespermission', 'App\Http\Controllers\RolespermissionController@store');
Route::put('/updateRolespermission/{id}', 'App\Http\Controllers\RolespermissionController@update');
Route::delete('/deleteRolespermission/{id}', 'App\Http\Controllers\RolespermissionController@destroy');
Route::get('/rolespermissions', 'App\Http\Controllers\RolespermissionController@list');
//Route::get('/roles-permissions', 'App\Http\Controllers\RolespermissionController@lists');
Route::delete('/delete-roles-permissions', 'App\Http\Controllers\RolespermissionController@haribu');
Route::delete('/delete-roles-permissions', 'App\Http\Controllers\RolespermissionController@haribu');
Route::post('/insert-roles-permission', 'App\Http\Controllers\RolespermissionController@tunza');
Route::post('/insert-rolepermission', 'App\Http\Controllers\RolespermissionController@tunzatwo');
Route::post('/insertdelete-rolepermission', 'App\Http\Controllers\RolespermissionController@tunzathree');

// ActivityprogressLog api router
Route::get('/activityprogresslogs', 'App\Http\Controllers\ActivityprogressLogController@index');
Route::get('/activityprogresslog/{id}', 'App\Http\Controllers\ActivityprogressLogController@show');
Route::post('/insertactivityprogresslogs', 'App\Http\Controllers\ActivityprogressLogController@store');
Route::put('/updateactivityprogresslogs/{id}', 'App\Http\Controllers\ActivityprogressLogController@update');
Route::delete('/deleteactivityprogresslogs/{id}', 'App\Http\Controllers\ActivityprogressLogController@destroy');
Route::get('/activity-progress-log', 'App\Http\Controllers\ActivityprogressLogController@list');


//Uploading multiple files api router
Route::post('/file-uploads',[DocumentController::class, 'store']);
Route::get('/fetch-attachments',[DocumentController::class, 'getAttachments']);
Route::delete('/deleteattachment/{id}',[DocumentController::class, 'destroy']);


// Funddisbursement api router
Route::get('/disbursements', [FunddisbursementController::class, 'index']);
Route::get('/funddisbursement/{id}', [FunddisbursementController::class, 'show']);
Route::post('/insertFunddisbursement', [FunddisbursementController::class, 'store']);
Route::put('/updateFunddisbursement/{id}', [FunddisbursementController::class, 'update']);
Route::get('/disbursement', [FunddisbursementController::class, 'list']);
Route::post('/updatefundspent/{id}', [FunddisbursementController::class, 'updatefundspent']);
Route::post('/updatefundreceived/{id}', [FunddisbursementController::class, 'updatefundreceived']);
Route::delete('/deleteFunddisbursement/{id}', [FunddisbursementController::class, 'destroy']);
Route::post('/fund-progress-status/{id}', [FunddisbursementController::class, 'updatez']);
Route::post('/update-progress-status', [FunddisbursementController::class, 'updatespent']);
Route::post('/insert-unique-funddisbursement', [FunddisbursementController::class, 'storeuniq']);


//Indicators api router
Route::get('/indicators', [IndicatorController::class, 'index']);
Route::get('/indicator/{id}', [IndicatorController::class, 'show']);
Route::post('/insertIndicator', [IndicatorController::class, 'store']);
Route::put('/updateIndicator/{id}', [IndicatorController::class, 'update']);
Route::delete('/deleteIndicator/{id}', [IndicatorController::class, 'destroy']);
Route::get('/indicatorsby', 'App\Http\Controllers\IndicatorController@list');


//Contract api router
Route::get('/contracts', [ContractController::class, 'index']);
Route::get('/contracts/all', [ContractController::class, 'all']);
Route::get('/contract/{id}', [ContractController::class, 'show']);
Route::post('/insertContract', [ContractController::class, 'store']);
Route::put('/updateContract/{id}', [ContractController::class, 'update']);
Route::delete('/deleteContract/{id}', [ContractController::class, 'destroy']);
Route::get('/contractby', 'App\Http\Controllers\ContractController@list');
Route::post('/update-contract-stage/{id}', [ContractController::class, 'updatez']);


//ContractProgressProgress api router
Route::get('/contractprogresses', [ContractProgressController::class, 'index']);
Route::get('/contractprogresses/all', [ContractProgressController::class, 'all']);
Route::get('/contractprogress/{id}', [ContractProgressController::class, 'show']);
Route::post('/insertContractProgress', [ContractProgressController::class, 'store']);
Route::put('/updateContractProgress/{id}', [ContractProgressController::class, 'update']);
Route::delete('/deleteContractProgress/{id}', [ContractProgressController::class, 'destroy']);
Route::get('/contractprogressby', [ContractProgressController::class, 'list']);

//Contracts-Attachments-Uploading files api router
Route::post('/contractfile-uploads',[ContractattachmentController::class, 'store']);
Route::get('/fetch-contractattachments',[ContractattachmentController::class, 'getAttachments']);
Route::delete('/deletecontractattachment/{id}',[ContractattachmentController::class, 'destroy']);
Route::get('/attachmentbyactivityid', 'App\Http\Controllers\ContractattachmentController@list');
Route::get('/contract-attachment', 'App\Http\Controllers\ContractattachmentController@lists');



//CSV import and export files api router
Route::post('file-import', [CsvController::class, 'fileImport'])->name('file-import');
Route::get('file-export', [CsvController::class, 'fileExport'])->name('file-export');

// Contractor api router
Route::get('/contractors', 'App\Http\Controllers\ContractorController@index');
Route::get('/contractor/{id}', 'App\Http\Controllers\ContractorController@show');
Route::post('/insertContractor', 'App\Http\Controllers\ContractorController@store');
Route::put('/updateContractor/{id}', 'App\Http\Controllers\ContractorController@update');
Route::delete('/deleteContractor/{id}', 'App\Http\Controllers\ContractorController@destroy');


// ContractCategory api router
Route::get('/contractcategories', 'App\Http\Controllers\ContractCategoryController@index');
Route::get('/contractcategory/{id}', 'App\Http\Controllers\ContractCategoryController@show');
Route::post('/insertContractCategory', 'App\Http\Controllers\ContractCategoryController@store');
Route::put('/updateContractCategory/{id}', 'App\Http\Controllers\ContractCategoryController@update');
Route::delete('/deleteContractCategory/{id}', 'App\Http\Controllers\ContractCategoryController@destroy');

 

//Request api router
Route::get('/request', [ChangerequestController::class, 'index']);
Route::post('/request', [ChangerequestController::class, 'store']);
Route::get('/request/{id}', [ChangerequestController::class, 'show']);
Route::put('/request/{id}', [ChangerequestController::class, 'update']);
Route::delete('/decission/{id}', [ChangerequestController::class, 'destroy']);
Route::get('/requestall', 'App\Http\Controllers\ChangerequestController@list');

//Mnrtsystems api router
Route::get('/mnrtsystems', [MnrtsystemController::class, 'index']);
Route::post('/mnrtsystem', [MnrtsystemController::class, 'store']);
Route::get('/mnrtsystem/{id}', [MnrtsystemController::class, 'show']);
Route::put('/mnrtsystem/{id}', [MnrtsystemController::class, 'update']);
Route::delete('/mnrtsystem/{id}', [MnrtsystemController::class, 'destroy']);


//Requestcategories api router
Route::get('/categories', [RequestcategoryController::class, 'index']);
Route::post('/category', [RequestcategoryController::class, 'store']);
Route::get('/category/{id}', [RequestcategoryController::class, 'show']);
Route::put('/category/{id}', [RequestcategoryController::class, 'update']);
Route::delete('/category/{id}', [RequestcategoryController::class, 'destroy']);

//Priorities api router
Route::get('/priorities', [PriorityController::class, 'index']);
Route::post('/priority', [PriorityController::class, 'store']);
Route::get('/priority/{id}', [PriorityController::class, 'show']);
Route::put('/priority/{id}', [PriorityController::class, 'update']);
Route::delete('/priority/{id}', [PriorityController::class, 'destroy']);

});




