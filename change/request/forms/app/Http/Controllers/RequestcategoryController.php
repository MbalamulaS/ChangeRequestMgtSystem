<?php

namespace App\Http\Controllers;

use App\Models\Requestcategory;
use App\Http\Resources\RequestcategoryResource;

use Illuminate\Http\Request;

class RequestcategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $results = Requestcategory::all()->sortBy('id');
        return new RequestcategoryResource($results);
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
        $requestcategory = new Requestcategory();
        $requestcategory->category_name = $request->category_name;
        $requestcategory->created_at = $request->created_at;
        $requestcategory->updated_at = $request->updated_at;
        $requestcategory->deleted_at = $request->deleted_at;
        if($requestcategory->save()){
            return new RequestcategoryResource($requestcategory);

        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Requestcategory  $requestcategory
     * @return \Illuminate\Http\Response
     */
    public function show(Requestcategory $requestcategory, $id)
    {
        $requestcategory = Requestcategory::findOrFail($id);
        return new RequestcategoryResource($requestcategory);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Requestcategory  $requestcategory
     * @return \Illuminate\Http\Response
     */
    public function edit(Requestcategory $requestcategory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Requestcategory  $requestcategory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Requestcategory $requestcategory, $id)
    {
        $requestcategory = Requestcategory::findOrFail($id);
        $requestcategory->category_name = $request->category_name;
        $requestcategory->created_at = $request->created_at;
        $requestcategory->updated_at = $request->updated_at;
        $requestcategory->deleted_at = $request->deleted_at;
        if($requestcategory->save()){
            return new RequestcategoryResource($requestcategory);
    }
    }
    public function list(Request $request)
    {
        $requestcategory_query=Requestcategory::with(['activity']);
        if($request->activity_id){
            $requestcategory_query->where('activity_id',$request->activity_id);
        }
        $requestcategory=$requestcategory_query->get();
                    return response()->json([

                    'message'=>'Requestcategory successfully fetched',
                    'data'=>$requestcategory
                    ],200);
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Requestcategory  $requestcategory
     * @return \Illuminate\Http\Response
     */
    public function destroy(Requestcategory $requestcategory, $id)
    {
        $requestcategory = Requestcategory::findOrFail($id);
        if($requestcategory->delete()){
            return new RequestcategoryResource($requestcategory);
        }
    }
}