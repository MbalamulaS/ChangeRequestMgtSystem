<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Hash;
use Auth;

class ChangepassworController extends Controller
{
    public function showChangePasswordGet() {
        return view('auth.passwords.change-password');
    }

    public function changePasswordPost(Request $request) {
        if (!(Hash::check($request->get('current-password'), Auth::user()->password))) {
            // The passwords matches
            return response()->json(['Status' => 'Fail', 'Message' => 'Your current password does not matches with the password']);
        }

        if(strcmp($request->get('current-password'), $request->get('new-password')) == 0){
            // Current password and new password same
            return response()->json(['Status' => 'Fail', 'Message' => 'New Password cannot be same as your current password']);
            //return redirect()->back()->with("error","New Password cannot be same as your current password.");
        }

        $validatedData = $request->validate([
            'current-password' => 'required',
            'new-password' => 'required|string|min:8|confirmed',
        ]);

        //Change Password
        $user = Auth::user();
        $user->password = bcrypt($request->get('new-password'));
        $user->save();

        //return redirect()->back()->with("success","Password successfully changed!");
        return response()->json(['Status' => 'Success', 'Message' => 'Password successfully changed!']);

    }
}
