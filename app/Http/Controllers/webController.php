<?php

namespace App\Http\Controllers;

use App\Functions\WhatsApp;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Validator;
use Modules\Country\Entities\Region;
use Stevebauman\Location\Facades\Location;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendOTP;
use Modules\Client\Entities\Model as Client;

class webController extends BasicController
{
    public function lang($locale)
    {
        if (isset($locale) && in_array($locale, config('app.locales'))) {
            app()->setLocale($locale);
            session()->put('locale', $locale);
        }

        return redirect()->back();
    }
    
    public function ip()
    {
        $data = Location::get(request()->ip());
        // $data = Location::get('13.226.117.0');// +countryName: "Bahrain"    +countryCode: "BH"
        // $data = Location::get('103.84.120.0');// +countryName: "Saudi Arabia"   +countryCode: "SA"
        dd($data);
    }

    
    public function SetCountry($id)
    {
        session()->put('country', $id);
        return redirect()->back();
    }

    public function artisan($command)
    {
        try {
            Artisan::call($command, ['--force' => true]);
        } catch (\Exception $e) {
            Artisan::call($command);
        }
        dd(Artisan::output());
    }

    public function SendOTP()
    {  
        if(request('phone')){
            return response()->json([
                'code' => WhatsApp::SendOTP(request('phone')),
            ]);
        }elseif(request('email')){
            $code = rand(100000, 999999);
            if(request('forget')){
                $client_exists = Client::where([
                    'email' => request('email'),
                ])->exists();
                if($client_exists){
                    Mail::to(request('email'))->send(new SendOTP($code));
                    return response()->json([
                        'code' => $code,
                    ]);
                }else{
                    return response()->json([
                        'code' => NULL,
                    ]);
                }
            }else{
                Mail::to(request('email'))->send(new SendOTP($code));
                return response()->json([
                    'code' => $code,
                ]);
            }
        }
    }

    public function reorder(Request $request)
    {
        $validator = $request->validate([
            'ids' => 'required|array',
            'positions' => 'required|array',
            'table' => 'required|string',
        ]);

        $positions = [];
        foreach ($request->positions as $key => $value) {
            $positions[$key] = (int) ($value);
        }
        sort($positions, SORT_NUMERIC);
        $sql = '';
        foreach ($request->ids as $index => $id) {
            $sql .= "UPDATE `categories` SET `arrangement`={$positions[$index]} WHERE `id`={$id};";
            DB::table($request->table)->where('id', $id)->update([
                'arrangement' => $positions[$index],
            ]);
        }

        return response()->json([]);
    }

    public function switch(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => ['required', 'integer'],
            'column_name' => ['required', 'string'],
            'table' => ['required', 'string'],
            'value' => ['nullable', 'numeric'],
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 406);
        }

        if (Schema::hasTable($request->table, $request->column_name)) {
            if (Schema::hasColumn($request->table, $request->column_name)) {
                $check = $request->value ?? ! DB::table($request->table)->where('id', $request->id)->value($request->column_name);
                DB::table($request->table)->where('id', $request->id)->update([
                    $request->column_name => $check,
                ]);

                return response()->json($check);
            } else {
                return response()->json('Invalid Column');
            }
        } else {
            return response()->json('Invalid Table');
        }
    }

    public function RemoveIds(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'ids' => ['required', 'array'],
            'table' => ['required', 'string'],
        ]);
        if ($validator->fails()) {
            return response()->json();
        }

        if (Schema::hasTable($request->table)) {
            DB::table($request->table)->whereIn('id', $request->ids)->delete();

            return response()->json([
                'msg' => __('trans.DeletedSuccessfully'),
                'isConfirmed' => 1,
            ]);
        } else {
            return response()->json();
        }
    }

    public function country_regions($country_id)
    {
        $Append = '';
        foreach (Region::where('country_id', $country_id)->select('id','title_'.lang().' as title')->orderBy('title')->get() as $Region) {
            $Append .= '<option value="'.$Region->id.'">'.$Region->title.'</option>';
        }

        return response()->json($Append);
    }
}
