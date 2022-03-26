<?php

namespace App\Http\Controllers;

use App\Models\Institution;
use Illuminate\Http\Request;
use App\Http\Resources\InstitutionResource;
use App\Http\Controllers\Controller;

class InstitutionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $results = Institution::all()->sortBy('id');
        return new InstitutionResource($results);
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
        $institution = new Institution();
        $institution->inst_name = $request->inst_name;
        $institution->vote_code = $request->vote_code;
        $institution->sub_vote_no = $request->sub_vote_no;
        $institution->vote_name = $request->vote_name;
        $institution->sub_vote_name = $request->sub_vote_name;
        $institution->created_by = $request->created_by;
        $institution->updated_by = $request->updated_by;
        $institution->deleted_by = $request->deleted_by;
        $institution->status = $request->status;
        $institution->created_at = $request->created_at;
        $institution->updated_at = $request->updated_at;
        $institution->deleted_at = $request->deleted_at;
        if($institution->save()){
            return new InstitutionResource($institution);

        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Institution  $institution
     * @return \Illuminate\Http\Response
     */
    public function show(Institution $institution, $id)
    {
        $institution = Institution::findOrFail($id);
        return new InstitutionResource($institution);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Institution  $institution
     * @return \Illuminate\Http\Response
     */
    public function edit(Institution $institution)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Institution  $institution
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Institution $institution, $id)
    {
        $institution = Institution::findOrFail($id);
        $institution->inst_name = $request->inst_name;
        $institution->vote_code = $request->vote_code;
        $institution->sub_vote_no = $request->sub_vote_no;
        $institution->vote_name = $request->vote_name;
        $institution->sub_vote_name = $request->sub_vote_name;
        if($institution->save()){
            return new InstitutionResource($institution);
    }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Institution  $institution
     * @return \Illuminate\Http\Response
     */
    public function destroy(Institution $institution, $id)
    {
        $institution = Institution::findOrFail($id);
        if($institution->delete()){
            return new InstitutionResource($institution);
        }
    }
}
