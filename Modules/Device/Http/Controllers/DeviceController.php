<?php

namespace Modules\Device\Http\Controllers;

use App\Functions\Upload;
use App\Http\Controllers\BasicController;
use Illuminate\Http\Request;
use Modules\Category\Entities\Model as Category;
use Modules\Color\Entities\Model as Color;
use Modules\Brand\Entities\Model as Brand;
use Modules\Type\Entities\Model as Type;
use Modules\Device\Entities\Device;

class DeviceController extends BasicController
{
    public function index(Request $request)
    {
        $Devices = Device::get();

        return view('device::devices.index', compact('Devices'));
    }

    public function create()
    {
        $Brands = Brand::get();
        $Categories = Category::whereNull('parent_id')->with(['children' => function ($query) {
            $query->with(['Devices', 'Parent'])->withCount('Devices');
        }])->get();
        $types = Type::query()->Active()->get();

        return view('device::devices.create', compact('Categories','Brands','types'));
    }

    public function store(Request $request)
    {
        $Device = Device::create($request->only('title_ar', 'title_en','brand_id', 'quantity', 'short_desc_ar', 'short_desc_en', 'long_desc_ar', 'long_desc_en','price', 'discount_from', 'discount_to', 'discount_value', 'build_device'));

        $Device->types()->sync($request->type_ids);

        $this->store_update($Device->id, $request);

        alert()->success(__('trans.addedSuccessfully'));

        return redirect()->route('admin.devices.edit', $Device);
    }

    public function show($id)
    {
        return redirect()->route('admin.devices.edit', ['device' => $id]);
    }

    public function edit($id)
    {
        $Brands = Brand::get();
        $Device = Device::with(['Items','Gallery', 'Categories', 'Accessories', 'Specs'])->where('id', $id)->firstorfail();
        $Categories = Category::whereNull('parent_id')->with(['children' => function ($query) use ($id) {
            $query->with(['Parent', 'Devices' => function ($query2) use ($id) {
                $query2->whereNot('devices.id', $id);
            }])->withCount('Devices');
        }])->get();
        $Categories = Category::whereNull('parent_id')->with(['children' => function ($query) {
            $query->with(['Devices', 'Parent'])->withCount('Devices');
        }])->get();
        $types = Type::query()->Active()->get();

        return view('device::devices.edit', compact('Device', 'Categories','Brands','types'));
    }

    public function update(Request $request, $id)
    {
        $Device = Device::findOrFail($id);

        $Device->update($request->only('title_ar', 'title_en','brand_id', 'quantity', 'short_desc_ar', 'short_desc_en', 'long_desc_ar', 'long_desc_en','price', 'discount_from', 'discount_to', 'discount_value', 'build_device'));

        $Device->types()->sync($request->type_ids);

        $this->store_update($id, $request);

        alert()->success(__('trans.updatedSuccessfully'));

        return redirect()->back();
    }

    public function destroy($id)
    {
        $Device = Device::where('id', $id)->delete();
    }
    
    public function gallery(Request $request)
    {
        $Device = Device::with(["Gallery" => function($q){
            $q->WhereNull('color_id')->orwhere('color_id',request('color_id'));
        },"Headers" => function($q){
            $q->WhereNull('color_id')->orwhere('color_id',request('color_id'));
        }])->where('id', request('device_id'))->firstorfail();
        if(request('color_id')){
            $Color = Color::where('id',request('color_id'))->first();
            return view('device::devices.gallery', compact('Device','Color'));
        }else{
            $Colors = Color::whereIn('id',$Device->Items->pluck('color_id'))->get();
            return view('device::devices.gallery', compact('Device','Colors'));
        }
    }

    public function post_gallery(Request $request)
    {
        $Device = Device::where('id', request('device_id'))->firstorfail();
        $Device->Gallery()->where('color_id',request('color_id'))->update(['color_id'=>NULL]);
        $Device->Gallery()->whereIn('image',(array)request('old_gallery'))->update(['color_id'=>request('color_id')]);
        if ($request->gallery) {
            foreach ($request->gallery as $gallery) {
                $Device->Gallery()->create([
                    'image' => Upload::UploadFile($gallery, 'Devices'),
                ]);
            }
        }
        
        
        if ($request->hasFile('header')) {
            $Header = $Device->Headers()->where('color_id',request('color_id'))->first();
            if($Header){
                $Device->Headers()->update([
                    'header' => Upload::UploadFile($request->header, 'Devices'),
                ]);
            }else{       
                $Device->Headers()->create([
                    'color_id'=>request('color_id'),
                    'header' => Upload::UploadFile($request->header, 'Devices'),
                ]);
            }
        }
        
        alert()->success(__('trans.updatedSuccessfully'));
        
        return back();
    }


    public function store_update($id, Request $request)
    {

        $Device = Device::where('id', $id)->first();
        if ($request->hasFile('header')) {
            $Device->update([
                'header' => Upload::UploadFile($request->header, 'Devices'),
            ]);
        }
        $Device->Items()->delete();
        $Device->Items()->insert(collect($request->items)->map(function ($item) use($Device) {

            $item['device_id'] = $Device['id'];
        
            return $item;
        
        })->toarray());
        
        
        $Device->Categories()->sync(array_filter((array) $request->categories));
        $Device->Accessories()->sync(array_filter((array) $request->accessories));

        if ($request->old_gallery) {
            Upload::deleteImages($Device->Gallery()->whereNotIn('image', $request->old_gallery)->pluck('image')->toarray());
            $Device->Gallery()->whereNotIn('image', $request->old_gallery)->delete();
        }
        if ($request->gallery) {
            foreach ($request->gallery as $gallery) {
                $Device->Gallery()->create([
                    'image' => Upload::UploadFile($gallery, 'Devices'),
                ]);
            }
        }
        $Device->Features()->delete();
        if ($request->features) {
            foreach ($request->features as $feature) {
                if (isset($feature['title_ar']) && isset($feature['title_en'])) {
                    $Device->Features()->create([
                        'title_ar' => $feature['title_ar'],
                        'title_en' => $feature['title_en'],
                        'image' => isset($feature['image']) ? Upload::UploadFile($feature['image'], 'Devices') : (isset($feature['old_image']) ? $feature['old_image'] : ''),
                        'desc_ar' => $feature['desc_ar'],
                        'desc_en' => $feature['desc_en'],
                    ]);
                }
            }
        }

        $Device->Specs()->detach();
        if ($request->specs) {
            foreach ($request->specs as $specs_id => $Item) {
                if ($Item['desc_ar'] && $Item['desc_en']) {
                    $Device->Specs()->attach($specs_id, [
                        'desc_ar' => $Item['desc_ar'],
                        'desc_en' => $Item['desc_en'],
                    ]);
                }
            }
        }

    }

    public function new_arrivals(Request $request)
    {
        $Devices = Device::select('id', 'new_arrival', 'title_'.lang())->get();

        return view('device::new_arrivals', compact('Devices'));
    }

    public function post_new_arrivals(Request $request)
    {
        Device::query()->update([
            'new_arrival' => 0,
        ]);
        Device::whereIn('id', array_filter((array) $request->devices))->update([
            'new_arrival' => 1,
        ]);
        alert()->success(__('trans.updatedSuccessfully'));

        return redirect()->back();
    }

    public function mostselling(Request $request)
    {
        $Devices = Device::select('id', 'most_selling', 'title_'.lang())->get();

        return view('device::mostselling', compact('Devices'));
    }

    public function post_mostselling(Request $request)
    {
        Device::query()->update([
            'most_selling' => 0,
        ]);
        Device::whereIn('id', array_filter((array) $request->devices))->update([
            'most_selling' => 1,
        ]);
        alert()->success(__('trans.updates'));

        return redirect()->back();
    }

    public function featured(Request $request)
    {
        $Devices = Device::select('id', 'featured', 'title_'.lang())->get();

        return view('device::featured', compact('Devices'));
    }

    public function post_featured(Request $request)
    {
        Device::query()->update([
            'featured' => 0,
        ]);
        Device::whereIn('id', array_filter((array) $request->devices))->update([
            'featured' => 1,
        ]);
        alert()->success(__('trans.updatedSuccessfully'));

        return redirect()->back();
    }
}
