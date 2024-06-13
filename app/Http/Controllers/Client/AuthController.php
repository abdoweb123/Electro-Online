<?php

namespace App\Http\Controllers\Client;

use App\Functions\Upload;
use App\Http\Controllers\BasicController;
use App\Http\Requests\Client\ForgetRequest;
use App\Http\Requests\Client\LoginRequest;
use App\Http\Requests\Client\ProfileRequest;
use App\Http\Requests\Client\RegisterRequest;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Modules\Client\Entities\Model as Client;

class AuthController extends BasicController
{
    public function login(LoginRequest $request)
    {
        $client_id = client_id();
        if (auth('client')->attempt($request->only('email', 'password'))) {
//            session()->flash('success', __('trans.loginSuccessfully'));
            DB::table('wishlist')->where('client_id', $client_id)->update(['client_id' => auth('client')->id()]);

            return redirect()->route('Client.home');
        }
        session()->flash('error', __('trans.emailPasswordIncorrect'));

        return redirect()->back();
    }

    public function register(RegisterRequest $request)
    {
        $client_id = client_id();

        $client = Client::create([
            'country_id' => $request->get('country_id') ?? Country()->id,
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'phone' => $request->get('phone'),
            'password' => bcrypt($request->get('password')),
        ]);

        DB::table('wishlist')->where('client_id', $client_id)->update(['client_id' => auth('client')->id()]);
        auth('client')->login($client);
//        session()->flash('success', __('trans.profileCompleted'));

        return redirect()->route('Client.profile');
    }

    public function profile(ProfileRequest $request)
    {
        $client_id = client_id();
        $client = auth('client')->user();
        $client->name = $request->get('name');
        $client->email = $request->get('email');
        
        if ($request->image) {
            $client->image = Upload::UploadFile($request->image, 'Clients');
        }
        if ($request->has('password') && ! empty($request->get('password'))) {
            $client->password = bcrypt($request->get('password'));
        }
        
        $client->save();
        
        DB::table('wishlist')->where('client_id', $client_id)->update(['client_id' => auth('client')->id()]);
//        session()->flash('success', __('trans.updatedSuccessfully'));

        return redirect()->route('Client.profile');
    }

    public function forget(ForgetRequest $request)
    {
        Client::where('email', $request->email)->update(['password' => Hash::make($request->password)]);
        $Client = Client::where('email', $request->email)->first();
        if($Client){
            auth('client')->login($Client);
//            session()->flash('success', __('trans.loginSuccessfully'));
        }else{
            session()->flash('error', __('trans.emailPasswordIncorrect'));
        }

        return redirect()->route('Client.home');
    }

    public function logout()
    {
        if (auth('client')->check()) {
            auth('client')->logout();
        }
//        session()->flash('success', __('trans.logoutSuccessfully'));

        return redirect()->route('Client.home');
    }
}
