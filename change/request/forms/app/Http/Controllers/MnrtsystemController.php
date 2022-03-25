<?php

namespace App\Http\Controllers;
use App\Models\Mnrtsystem;
use App\Http\Resources\MnrtsystemResource;
use Illuminate\Http\Request;

class MnrtsystemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $results = Mnrtsystem::all()->sortBy('id');
        return new MnrtsystemResource($results);
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
        $mnrtsystem = new Mnrtsystem();
        $mnrtsystem->mnrtsystem_name = $request->mnrtsystem_name;
        $mnrtsystem->created_at = $request->created_at;
        $mnrtsystem->updated_at = $request->updated_at;
        $mnrtsystem->deleted_at = $request->deleted_at;
        if($mnrtsystem->save()){
            return new MnrtsystemResource($mnrtsystem);

        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Mnrtsystem  $mnrtsystem
     * @return \Illuminate\Http\Response
     */
    public function show(Mnrtsystem $mnrtsystem, $id)
    {
        $mnrtsystem = Mnrtsystem::findOrFail($id);
        return new MnrtsystemResource($mnrtsystem);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Mnrtsystem  $mnrtsystem
     * @return \Illuminate\Http\Response
     */
    public function edit(Mnrtsystem $mnrtsystem)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Mnrtsystem  $mnrtsystem
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Mnrtsystem $mnrtsystem, $id)
    {
        $mnrtsystem = Mnrtsystem::findOrFail($id);
        $mnrtsystem->mnrtsystem_name = $request->mnrtsystem_name;
        $mnrtsystem->created_at = $request->created_at;
        $mnrtsystem->updated_at = $request->updated_at;
        $mnrtsystem->deleted_at = $request->deleted_at;
        if($mnrtsystem->save()){
            return new MnrtsystemResource($mnrtsystem);
    }
    }
    public function list(Request $request)
    {
        $mnrtsystem_query=Mnrtsystem::with(['activity']);
        if($request->activity_id){
            $mnrtsystem_query->where('activity_id',$request->activity_id);
        }
        $mnrtsystem=$mnrtsystem_query->get();
                    return response()->json([

                    'message'=>'Mnrtsystem successfully fetched',
                    'data'=>$mnrtsystem
                    ],200);
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Mnrtsystem  $mnrtsystem
     * @return \Illuminate\Http\Response
     */
    public function destroy(Mnrtsystem $mnrtsystem, $id)
    {
        $mnrtsystem = Mnrtsystem::findOrFail($id);
        if($mnrtsystem->delete()){
            return new MnrtsystemResource($mnrtsystem);
        }
    }
}
