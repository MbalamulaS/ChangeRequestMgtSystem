<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\PermissionResource;

class PermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $results = Permission::all()->sortBy('id');
        return new PermissionResource($results);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $permission = new Permission();
        $permission->permission_code = $request->permission_code;
        $permission->description = $request->description;
        $permission->created_by = $request->created_by;
        $permission->updated_by = $request->updated_by;
        $permission->deleted_by = $request->deleted_by;
        $permission->status = $request->status;
        $permission->created_at = $request->created_at;
        $permission->updated_at = $request->updated_at;
        $permission->deleted_at = $request->deleted_at;
        if($permission->save()){
            return new PermissionResource($permission);

    }
}

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Permission $permission, $id)
    {
        $permission = Permission::findOrFail($id);
        return new PermissionResource($permission);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Permission $permission, $id)
    {
        $permission = Permission::findOrFail($id);
        $permission->permission_code = $request->permission_code;
        $permission->description = $request->description;
        $permission->created_by = $request->created_by;
        $permission->updated_by = $request->updated_by;
        $permission->deleted_by = $request->deleted_by;
        $permission->status = $request->status;
        $permission->created_at = $request->created_at;
        $permission->updated_at = $request->updated_at;
        $permission->deleted_at = $request->deleted_at;
        if($permission->save()){
            return new PermissionResource($permission);

    }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Permission $permission, $id)
    {
        $permission = Permission::findOrFail($id);
        if($permission->delete()){
            return new PermissionResource($permission);
        }

    }
}
