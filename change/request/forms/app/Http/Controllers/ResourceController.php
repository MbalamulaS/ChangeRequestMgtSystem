<?php

namespace App\Http\Controllers;

use App\Models\Resource;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\ResourceResource;

class ResourceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $results = Resource::all()->sortBy('id');
        return new ResourceResource($results);
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
        $resource = new Resource();
        $resource->activity_id = $request->activity_id;
        $resource->gfs_id = $request->gfs_id;
        $resource->unit_cost = $request->unit_cost;
        $resource->unit_count = $request->unit_count;
        $resource->day = $request->day;
        $resource->created_by = $request->created_by;
        $resource->updated_by = $request->updated_by;
        $resource->deleted_by = $request->deleted_by;
        $resource->status = $request->status;
        $resource->created_at = $request->created_at;
        $resource->updated_at = $request->updated_at;
        $resource->deleted_at = $request->deleted_at;
        if($resource->save()){
            return new ResourceResource($resource);

        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Resource  $resource
     * @return \Illuminate\Http\Response
     */
    public function show(Resource $resource, $id)
    {
        $resource = Resource::findOrFail($id);
        return new ResourceResource($resource);
    }
    public function list(Request $request)
    {
        $resource_query=Resource::with(['activity']);
        if($request->activity_id){
            $resource_query->where('activity_id',$request->activity_id);
        }
        $resource=$resource_query->get();
                    return response()->json([

                    'message'=>'Resource successfully fetched',
                    'data'=>$resource
                    ],200);
    
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Resource  $resource
     * @return \Illuminate\Http\Response
     */
    public function edit(Resource $resource)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Resource  $resource
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Resource $resource, $id)
    {
        $resource = Resource::findOrFail($id);
        $resource->activity_id = $request->activity_id;
        $resource->gfs_id = $request->gfs_id;
        $resource->unit_cost = $request->unit_cost;
        $resource->unit_count = $request->unit_count;
        $resource->day = $request->day;
        $resource->created_by = $request->created_by;
        $resource->updated_by = $request->updated_by;
        $resource->deleted_by = $request->deleted_by;
        $resource->status = $request->status;
        $resource->created_at = $request->created_at;
        $resource->updated_at = $request->updated_at;
        $resource->deleted_at = $request->deleted_at;
        if($resource->save()){
            return new ResourceResource($resource);
    }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Resource  $resource
     * @return \Illuminate\Http\Response
     */
    public function destroy(Resource $resource, $id)
    {
        $resource = Resource::findOrFail($id);
        if($resource->delete()){
            return new ResourceResource($resource);
        }
    }
}
