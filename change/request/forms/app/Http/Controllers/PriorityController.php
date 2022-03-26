<?php

namespace App\Http\Controllers;
use App\Models\Priority;
use App\Http\Resources\PriorityResource;
use Illuminate\Http\Request;

class PriorityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $results = Priority::all()->sortBy('id');
        return new PriorityResource($results);
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
        $priority = new Priority();
        $priority->priority_name = $request->priority_name;
        $priority->created_at = $request->created_at;
        $priority->updated_at = $request->updated_at;
        $priority->deleted_at = $request->deleted_at;
        if($priority->save()){
            return new PriorityResource($priority);

        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Priority  $priority
     * @return \Illuminate\Http\Response
     */
    public function show(Priority $priority, $id)
    {
        $priority = Priority::findOrFail($id);
        return new PriorityResource($priority);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Priority  $priority
     * @return \Illuminate\Http\Response
     */
    public function edit(Priority $priority)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Priority  $priority
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Priority $priority, $id)
    {
        $priority = Priority::findOrFail($id);
        $priority->priority_name = $request->priority_name;
        $priority->created_at = $request->created_at;
        $priority->updated_at = $request->updated_at;
        $priority->deleted_at = $request->deleted_at;
        if($priority->save()){
            return new PriorityResource($priority);
    }
    }
    public function list(Request $request)
    {
        $priority_query=Priority::with(['activity']);
        if($request->activity_id){
            $priority_query->where('activity_id',$request->activity_id);
        }
        $priority=$priority_query->get();
                    return response()->json([

                    'message'=>'Priority successfully fetched',
                    'data'=>$priority
                    ],200);
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Priority  $priority
     * @return \Illuminate\Http\Response
     */
    public function destroy(Priority $priority, $id)
    {
        $priority = Priority::findOrFail($id);
        if($priority->delete()){
            return new PriorityResource($priority);
        }
    }
}