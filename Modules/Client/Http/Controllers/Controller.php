<?php

namespace Modules\Client\Http\Controllers;

use App\Functions\Upload;
use App\Http\Controllers\BasicController;
use Illuminate\Http\Request;
use Modules\Client\Entities\Model;
use Modules\Admin\Entities\Model as Admin;
use Illuminate\Support\Facades\DB;
use App\Events\SendMessage;

class Controller extends BasicController
{
    public function index(Request $request)
    {
        $Models = Model::get();

        return view('client::index', compact('Models'));
    }

    public function create()
    {
        return view('client::create');
    }

    public function store(Request $request)
    {
        $Model = Model::create($request->only(['name', 'email', 'phone']));
        $Model->password = bcrypt($request->password);
        if ($request->hasFile('image')) {
            $Model->image = Upload::UploadFile($request->image, 'Clients');
        }
        $Model->save();
        alert()->success(__('trans.addedSuccessfully'));

        return redirect()->back();
    }

    public function show($id,Request $request)
    {

        DB::table('chat')->where([
            'client_id' => $id,
            'from' => 'client'
        ])->update([
            'seen' => 1    
        ]);
        $Model = Model::where('id', $id)->firstorfail();
        $Admins = Admin::get();
        return view('client::show', compact('Model','Admins'));
    }

    public function SendMessage($id,Request $request)
    {
        DB::table('chat')->insert([
            'client_id' => request('client_id'),
            'admin_id' => request('admin_id'),
            'message' => request('message'),
            'from' => 'admin',
            'created_at' => now(),
        ]);
        event(new SendMessage(request('client_id'),request('message'),'admin',request('admin_id')));
        return response()->json(['success'=>1]);
    }
    
    public function edit($id)
    {
        $Model = Model::where('id', $id)->firstorfail();

        return view('client::edit', compact('Model'));
    }

    public function update(Request $request, $id)
    {
        $Model = Model::where('id', $id)->firstorfail();
        $Model->update($request->only(['name', 'email', 'phone']));
        if ($request->hasFile('image')) {
            $Model->image = Upload::UploadFile($request->image, 'Clients');
        }
        if ($request->password) {
            $Model->password = bcrypt($request->password);
        }
        $Model->save();
        alert()->success(__('trans.updatedSuccessfully'));

        return redirect()->back();
    }

    public function destroy($id)
    {
        $Model = Model::where('id', $id)->delete();
    }
}
