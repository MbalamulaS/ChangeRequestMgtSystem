<?php

namespace App\Http\Controllers;

use App\Models\Role;
use Illuminate\Http\Request;
use App\Http\Resources\RoleResource;
use App\Http\Controllers\Controller;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $results = Role::all()->sortBy('id');
        return new RoleResource($results);
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
        $role = new Role();
        $role->role_title = $request->role_title;
        $role->created_by = $request->created_by;
        $role->updated_by = $request->updated_by;
        $role->deleted_by = $request->deleted_by;
        $role->status = $request->status;
        $role->created_at = $request->created_at;
        $role->updated_at = $request->updated_at;
        $role->deleted_at = $request->deleted_at;
        if($role->save()){
            return new RoleResource($role);

        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function show(Role $role, $id)
    {
        $role = Role::findOrFail($id);
        return new RoleResource($role);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function edit(Role $role)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Role $role, $id)
    {
        $role = Role::findOrFail($id);
        $role->role_title = $request->role_title;
        $role->created_by = $request->created_by;
        $role->updated_by = $request->updated_by;
        $role->deleted_by = $request->deleted_by;
        $role->status = $request->status;
        $role->created_at = $request->created_at;
        $role->updated_at = $request->updated_at;
        $role->deleted_at = $request->deleted_at;
        if($role->save()){
            return new RoleResource($role);
    }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function destroy(Role $role, $id)
    {
        $role = Role::findOrFail($id);
        if($role->delete()){
            return new RoleResource($role);
        }
    }
}
