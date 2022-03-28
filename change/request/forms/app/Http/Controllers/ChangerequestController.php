<?php

namespace App\Http\Controllers;

use App\Models\Changerequest;
use Illuminate\Http\Request;
use App\Http\Resources\ChangerequestResource;

use DB;


class ChangerequestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Changerequest::all();

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

    public function show(Changerequest $changerequest,$id)
    {
        $changerequest = Changerequest::with('institution')
        ->fin($id);
        if($changerequest){
            return $changerequest;
        }
        else{
            return 'id not exixt';
        }

    }



    public function list(Request $request)
    {
        $user_query=Changerequest::with(['mnrtsystem', 'institution', 'requestcategory', 'priority']);
        if($request->mnrtsystem_id){
            $user_query->where('mnrtsystem_id',$request->mnrtsystem_id);
        }
        $user=$user_query->get();
                    return response()->json([

                    'message'=>'Users successfully fetched',
                    'data'=>$user
                    ],200);
    
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Changerequest  $changerequest
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $changerequest = new Changerequest();
        $changerequest ->request_type = $request->request_type;
        $changerequest ->request_desc = $request->request_desc;
        $changerequest ->priority = $request->priority;
        $changerequest ->deadline = $request->deadline;
        $changerequest ->reason = $request->reason;
        $changerequest ->inst_approval = $request->inst_approval;
        $changerequest ->inst_comment = $request->inst_comment;
        $changerequest ->mnrt_approval = $request->mnrt_approval;
        $changerequest ->mnrt_comment = $request->mnrt_comment;
        $changerequest ->condition = $request->condition;
        $changerequest ->institution_id = $request->institution_id;
        $changerequest ->mnrtsystem_id = $request->mnrtsystem_id;
        $changerequest ->created_by = $request->created_by;
        $changerequest ->updated_by = $request->updated_by;
        $changerequest ->deleted_by = $request->deleted_by;
        $changerequest ->status = $request->status;
        $changerequest ->deleted_at = $request->deleted_at;
        if($changerequest->save()){
            return response()->json([

                'status'=>'success',
                'data'=>$changerequest
                ],200);
            }else{
                return response()->json([

                    'status'=>'failure',
                    'data'=>$changerequest
                    ],401);
            }
        
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Changerequest  $changerequest
     * @return \Illuminate\Http\Response
     */
    // public function show(Changerequest $changerequest, $id)
    // {
    //     $changerequest = Changerequest::findOrFail($id);
    //     return new ChangerequestResource($changerequest);  

    // }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Changerequest  $changerequest
     * @return \Illuminate\Http\Response
     */
    public function edit(Changerequest $changerequest)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Changerequest  $changerequest
     * @param  \App\Models\Changerequest  $changerequest
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $changerequest = Changerequest::findOrFail($id);
        $changerequest ->request_type = $request->request_type;
        $changerequest ->request_desc = $request->request_desc;
        $changerequest ->priority = $request->priority;
        $changerequest ->deadline = $request->deadline;
        $changerequest ->reason = $request->reason;
        $changerequest ->inst_approval = $request->inst_approval;
        $changerequest ->inst_comment = $request->inst_comment;
        $changerequest ->mnrt_approval = $request->mnrt_approval;
        $changerequest ->mnrt_comment = $request->mnrt_comment;
        $changerequest ->condition = $request->condition;
        $changerequest ->institution_id = $request->institution_id;
        $changerequest ->mnrtsystem_id = $request->mnrtsystem_id;
        $changerequest ->created_by = $request->created_by;
        $changerequest ->updated_by = $request->updated_by;
        $changerequest ->deleted_by = $request->deleted_by;
        $changerequest ->status = $request->status;
        $changerequest ->deleted_at = $request->deleted_at;
        if($changerequest->save()){
            return new ChangerequestResource($changerequest);
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Changerequest  $changerequest
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        $changerequest = Changerequest::findOrFail($id);
        if($changerequest->delete()){
            return new ChangerequestResource($changerequest);
        }

    }
}
