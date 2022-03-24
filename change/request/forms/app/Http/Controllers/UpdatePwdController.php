<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\RequestHelper;
use Symfony\Component\HttpFoundation\Response;


class UpdatePwdController extends Controller
{
    public function updatePassword(Request $request){
        return $this->validateToken($request)->count() > 0 ? $this->changePassword($request) : $this->noToken();
    }

    private function validateToken(Request $request){
        return DB::table('password_resets')->where([
            'email' => $request->email,
            'token' => $request->token
        ]);
    }

    private function noToken() {
        return response()->json([
          'status' => 'Fail',
          'error' => 'Email or token does not exist.'
        ],Response::HTTP_UNPROCESSABLE_ENTITY);
    }

    private function changePassword(Request $request) {
        $user = User::whereEmail($request->email)->first();
        $user->update([
          'password'=>bcrypt($request->password)
        ]);
        $this->validateToken($request)->delete();
        return response()->json([
          'status' => 'Success',
          'data' => 'Password changed successfully.'
        ],Response::HTTP_CREATED);
    }  /*endof password change*/
}