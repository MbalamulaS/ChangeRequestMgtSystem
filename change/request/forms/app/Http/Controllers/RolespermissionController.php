<?php

namespace App\Http\Controllers;

use App\Models\Rolespermission;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\RolespermissionResource;
use Illuminate\Support\Facades\DB;

class RolespermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $results = Rolespermission::all()->sortBy('id');
        return new RolespermissionResource($results);
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
        $rolespermission = new Rolespermission();
        $rolespermission->role_id = $request->role_id;
        $rolespermission->permission_id = $request->permission_id;
        $rolespermission->created_by = $request->created_by;
        $rolespermission->updated_by = $request->updated_by;
        $rolespermission->deleted_by = $request->deleted_by;
        $rolespermission->created_at = $request->created_at;
        $rolespermission->updated_at = $request->updated_at;
        $rolespermission->deleted_at = $request->deleted_at;
        if($rolespermission->save()){
            return new RolespermissionResource($rolespermission);

        }
    }

    public function tunza(Request $request)
    {

        $rolespermission = new Rolespermission();
        $rolespermission->role_id = $request->role_id;
        $rolespermission->permission_id = $request->permission_id;
        if($rolespermission->save()){
            return new RolespermissionResource($rolespermission);
        }
    }

    public function tunzatwo(Request $request)
    {

        if($request->isMethod('post')){
            $rolespemissionData = $request->input();
            //echo "<pre>"; print_r($rolespemissionData); die;
            foreach ($rolespemissionData['roles'] as $key => $value) {
                $rolespermission = new Rolespermission;
                $rolespermission->role_id =$value['role_id'];
                $rolespermission->permission_id =$value['permission_id'];
                $rolespermission->save();

            }
            return response()->json(['message'=>'arrays of rolesperssion inserted successfully']);
            
        }
    
    }

    public function tunzathree(Request $request)
    {
	$rolespermission_query=Rolespermission::with(['role']);
        if($request->role_id){
            $rolespermission_query->where('role_id',$request->role_id);
        }
	$rolespermission=$rolespermission_query->delete();
        if($request->isMethod('post')){
            $rolespemissionData = $request->input();
            //echo "<pre>"; print_r($rolespemissionData); die;
            foreach ($rolespemissionData['roles'] as $key => $value) {
                $rolespermission = new Rolespermission;
                $rolespermission->role_id =$value['role_id'];
                $rolespermission->permission_id =$value['permission_id'];
                $rolespermission->save();

            }
            return response()->json(['message'=>'arrays of rolesperssion inserted successfully']);
            
        }
    
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Rolespermission  $rolespermission
     * @return \Illuminate\Http\Response
     */
    public function show(Rolespermission $rolespermission, $id)
    {
        $rolespermission = Rolespermission::findOrFail($id);
        return new RolespermissionResource($rolespermission);
    }

    // public function list(Request $request)
    // {
    //     $rolespermission_query=Rolespermission::with(['role']);
    //     if($request->role_id){
    //         $rolespermission_query->where('role_id',$request->role_id);
    //     }
    //     $rolespermission=$rolespermission_query->get();
    //                 return response()->json([

    //                 'message'=>'Rolespermission successfully fetched',
    //                 'data'=>$rolespermission
    //                 ],200);
    
    // }

    public function list(Request $request)
    {
        $rolespermission_query=Rolespermission::with(['permission','role']);
        if($request->role_id){
            $rolespermission_query->where('role_id',$request->role_id);
        }
        $rolespermission=$rolespermission_query->get();
                    return response()->json([

                    'message'=>'Rolespermission successfully fetched',
                    'data'=>$rolespermission
                    ],200);
    
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Rolespermission  $rolespermission
     * @return \Illuminate\Http\Response
     */
    public function edit(Rolespermission $rolespermission)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Rolespermission  $rolespermission
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Rolespermission $rolespermission, $id)
    {
        $rolespermission = Rolespermission::findOrFail($id);
        $rolespermission->role_id = $request->role_id;
        $rolespermission->permission_id = $request->permission_id;
        $rolespermission->created_by = $request->created_by;
        $rolespermission->updated_by = $request->updated_by;
        $rolespermission->deleted_by = $request->deleted_by;
        $rolespermission->created_at = $request->created_at;
        $rolespermission->updated_at = $request->updated_at;
        $rolespermission->deleted_at = $request->deleted_at;
        if($rolespermission->save()){
            return new RolespermissionResource($rolespermission);
    }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Rolespermission  $rolespermission
     * @return \Illuminate\Http\Response
     */
    public function destroy(Rolespermission $rolespermission, $id)
    {
        $rolespermission = Rolespermission::findOrFail($id);
        if($rolespermission->delete()){
            return new RolespermissionResource($rolespermission);
        }
    }

    public function haribu(Request $request)
    {
        $rolespermission_query=Rolespermission::with(['role']);
        if($request->role_id){
            $rolespermission_query->where('role_id',$request->role_id);
        }
        $rolespermission=$rolespermission_query->delete();
                    return response()->json([

                    'message'=>'Total number of data deleted successful',
                    'data'=>$rolespermission
                    ],200);
    
    }
}
