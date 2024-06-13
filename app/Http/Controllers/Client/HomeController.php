<?php

namespace App\Http\Controllers\Client;

use App\Functions\Upload;
use App\Functions\WhatsApp;
use App\Http\Controllers\BasicController;
use App\Mail\OrderSummary;
use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Modules\Ad\Entities\Model as Ad;
use Modules\Address\Entities\Model as Address;
use Modules\Client\Entities\Model as Client;
use Modules\Contact\Entities\Model as Contact;
use Modules\Brand\Entities\Model as Brand;
use Modules\Country\Entities\Country;
use Modules\Country\Entities\Region as Region;
use Modules\Device\Entities\Device;
use Modules\Order\Entities\Model as Order;
use Modules\Service\Entities\Model as Service;
use Modules\Category\Entities\Model as Category;
use Modules\Slider\Entities\Model as Slider;
use Modules\TypeItem\Entities\Model as TypeItem;
use App\Events\SendMessage;
use Modules\Office\Entities\Model as Office;
use Modules\Protection\Entities\Model as Protection;
use Modules\Coupon\Entities\Model as Coupon;

class HomeController extends BasicController
{
    public function SendMessage(Request $request)
    {
        $message = request('message');
        DB::table('chat')->insert([
            'client_id' => client_id(),
            'message' => $message,
            'from' => 'client',
            'created_at' => now(),
        ]);
        event(new SendMessage(client_id(),$message,'client'));
        return response()->json(['success'=>1]);
    }
    
    public function SetData(Request $request)
    {
        session()->put('currancy', request('currancy'));
        session()->put('ship_to', request('ship_to'));
        $locale = request('lang');
        if (isset($locale) && in_array($locale, config('app.locales'))) {
            app()->setLocale($locale);
            session()->put('locale', $locale);
        }
        return redirect()->back();
    }
    
    public function home()
    {
        $Ads = Ad::Active()->get();
        $Sliders = Slider::Active()->get();
        $Brands = Brand::Active()->get();
        $new_arrivals = Device::with(['Gallery', 'Categories'])->where('new_arrival', 1)->activeBrand()->take(6)->get();
        $most_selling = Device::with(['Gallery', 'Categories'])->where('most_selling', 1)->activeBrand()->take(6)->get();
        $featured = Device::where('featured', 1)->activeBrand()->take(6)->get();
        $offers = Device::query()->HasDiscount()->activeBrand()->take(3)->get();
        $Services = Service::Active()->get();
//        $Categories = Category::Active()->whereNull('parent_id')->whereHas('children.Devices')->withCount('children')
//            ->with(['children'=>function($query){
//                $query->whereHas('Devices')->withCount('Devices')->Active();
//            }])->get();

        $Categories = Category::Active()
            ->whereNull('parent_id')
            ->whereHas('children.Devices', function ($query) {
                $query->where(function ($q) {
                    $q->whereHas('Brand', function ($q) {
                        $q->where('status', 1);
                    })->orWhereDoesntHave('Brand');
                });
            })
            ->withCount('children')
            ->with(['children' => function ($query) {
                $query->whereHas('Devices', function ($query) {
                    $query->where(function ($q) {
                        $q->whereHas('Brand', function ($q) {
                            $q->where('status', 1);
                        })->orWhereDoesntHave('Brand');
                    });
                })
                    ->with(['Devices' => function ($query) {
                        $query->where(function ($q) {
                            $q->whereHas('Brand', function ($q) {
                                $q->where('status', 1);
                            })->orWhereDoesntHave('Brand');
                        });
                    }])
                    ->withCount(['Devices' => function ($query) {
                        $query->where(function ($q) {
                            $q->whereHas('Brand', function ($q) {
                                $q->where('status', 1);
                            })->orWhereDoesntHave('Brand');
                        });
                    }])->Active();
            }])
            ->get();


        return view('Client.index', compact('Sliders', 'Ads', 'new_arrivals', 'most_selling', 'featured', 'offers', 'Services','Categories','Brands'));
    }

    public function device($device_id,$color_id = null)
    {
        $Device = Device::where('id', $device_id)->with(['Specs', 'Accessories', 'Categories', 'Features', 'Gallery'])->firstorfail();

        if($Device->Items->count() && $color_id == NULL){
            return redirect()->route('Client.device',['device_id'=>$device_id,'color_id'=>$Device->Items->whereNotNull('color_id')->first()->color_id]);
        }
        
        $wishlist = DB::table('wishlist')->where('client_id', client_id())->where('device_id', $Device->id)->exists();

        return view('Client.device', compact('Device', 'wishlist'));
    }

    public function BuildYourDevice ($device_id,$color_id=null)
    {
        $Device = Device::where('id', $device_id)->with(['Categories', 'Gallery','Items'])->firstorfail();

        return view('Client.build_your_device', compact('Device'));
    }


    public function report()
    {
        try {
            $Device = Device::where('id', request('device_id'))->with(['Categories', 'Gallery'])->firstOrFail();
            $SelectedItem = $Device->Items()
                ->when(request('size_id'), function ($query) {
                    return $query->where('size_id', request('size_id'));
                })
                ->when(request('color_id'), function ($query) {
                    return $query->where('color_id', request('color_id'));
                })
                ->when(request('specification_id'), function ($query) {
                    return $query->where('id', request('specification_id'));
                })
                ->first();

            $data = [
                'Device' => $Device,
                'SelectedItem' => $SelectedItem,
                'SelectedSize' => request('size_id'),
                'SelectedColor' => request('color_id'),
                'TypeItems' => TypeItem::whereIn('id', (array)request('itemTypes'))->get(),
                'Accessories' => Device::whereIn('id', (array)request('accessories'))->get(),
            ];

            $pdf = \niklasravnsborg\LaravelPdf\Facades\Pdf::loadView('Client.report', $data);
        } catch (\Exception $exception) {
            return  $exception->getMessage();
        }

        return $pdf->stream('Quotation.pdf');
    }
    
    public function reports()
    {
        try {
            $data['Cart'] = Cart::where('client_id', client_id())->with('Device', 'Color')->get();
            // return view('Client.reports', $data)->render();
            $pdf = \niklasravnsborg\LaravelPdf\Facades\Pdf::loadView('Client.reports', $data);
        }catch (\Exception $exception)
        {
            return  $exception->getMessage();
        }
        return $pdf->stream('Quotation.pdf');
    }


    public function categories(Request $request)
    {
        $Category = NULL;
        if(request('category')){        
            $Category = Category::Active()->where('id',request('category'))->first();
        }

        $Devices = Device::with(['Gallery', 'Categories'])
            ->when(request('brand_id'), function ($query) {
                return $query->where('brand_id', request('brand_id'));
            })
            ->when(request('categories'), function ($query) {
                return $query->whereHas('Categories', function ($query) {
                    $query->whereIn('categories.id', request('categories'));
                });
            })
            ->when(request('category'), function ($query) {
                return $query->whereHas('Categories', function ($query) {
                    $query->where('categories.id', request('category'));
                });
            })
            ->when(request('colors'), function ($query) {
                return $query->whereHas('Items', function ($query) {
                    $query->whereIn('device_item.color_id', request('sizes'));
                });
            })
            ->when(request('sizes'), function ($query) {
                return $query->whereHas('Items', function ($query) {
                    $query->whereIn('device_item.size_id', request('sizes'));
                });
            })
            ->when(request('processors'), function ($query) {
                return $query->whereIn('processor_id', request('processors'));
            })
            ->when(request('memories'), function ($query) {
                return $query->whereIn('memory_id', request('memories'));
            })
            ->when(request('storages'), function ($query) {
                return $query->whereIn('storage_id', request('storages'));
            })
            ->when(request('os'), function ($query) {
                return $query->whereIn('os', request('os'));
            })
            ->when(request('max_price'), function ($query) {
                return $query->where('price', '>=', request('max_price'));
            })
            ->when(request('min_price'), function ($query) {
                return $query->where('price', '>=', request('min_price'));
            })
            ->when(request('filter'), function ($query) {
                return $query->HasDiscount();
            })
            ->when(request('search'), function ($query) {
                $searchTerm = request('search');

                return $query->where('title_ar', 'LIKE', "%{$searchTerm}%")->orWhere('title_en', 'LIKE', "%{$searchTerm}%");
            })
            ->paginate(25);

        return view('Client.categories', compact('Devices','Category'));
    }



    public function submit($delivery_id, Request $request)
    {
        if (auth('client')->check()) {
            $Client = auth('client')->user();
        } else {
            $Client = Client::where('phone',$request->phone)->orwhere('email', $request->email)->first();
            if (! $Client) {
                $Client = Client::create([
                    'country_id' => $request->country_id,
                    'name' => $request->name,
                    'email' => $request->email,
                    'phone' => $request->phone,
                    'password' => Hash::make(Str::random(10)),
                ]);
            }
        }

        if ($delivery_id == 1) {
            $branch_id = null;
            if ($request->address_id) {
                $Address = Address::find($request->address_id);
            } else {
                $Address = Address::create([
                    'client_id' => $Client->id,
                    'region_id' => $request->region_id,
                    'block' => $request->block,
                    'road' => $request->road,
                    'building_no' => $request->building_no,
                    'floor_no' => $request->floor_no,
                    'apartment' => $request->apartment,
                    'type' => $request->type,
                    'additional_directions' => $request->additional_directions,
                ]);
            }
        } else {
            $Address = null;
            $branch_id = $request->branch_id;
        }

        $Cart = Cart::where('client_id', client_id())->with('Device', 'Color')->get();
        $sub_total = 0;
        $discount = 0;
        foreach ($Cart as $key => $CartItem) {
            if ($CartItem->item_id != null){
                $PriceItem = $CartItem->Device->Items->when($CartItem->item_id, function ($query) use($CartItem) {
                        return $query->where('id', $CartItem->item_id);
                    })->first() ?? $CartItem->Device;

                $sub_total += $PriceItem->CalcPrice() * $CartItem->quantity;
            }
            else{
                $sub_total += $CartItem->Device->CalcPrice() * $CartItem->quantity;
            }

            if (count($CartItem->typeItem)){
                foreach ($CartItem->typeItem as $item){
                    $sub_total += $item->CalcPrice() * $CartItem->quantity;
                }
            }

            $discount += ($PriceItem->Price() - $PriceItem->CalcPrice()) * $CartItem->quantity;
        }



        if($request->input('extra_data')){
            $coupon = Coupon::where('id', $request->input('extra_data'))->first(['discount_amount']);
            $coupon_discount = $sub_total / 100 * $coupon['discount_amount'];
        }

        $vat = $sub_total / 100 * setting('vat');
        $delivery_cost = $Address ? ($Address->Region()->select('delivery_cost')->value('delivery_cost')  *  Country()->currancy_value) : 0;

        $coins_value = (((setting('discount_one_coin') * auth('client')->user()->coins) / setting('coins_no')) );

        $Order = Order::create([
            'client_id' => $Client->id,
            'delivery_id' => $delivery_id,
            'address_id' => $Address ? $Address->id : null,
            'branch_id' => $branch_id,
            'payment_id' => $request->payment_id,
            'currency_id' => Country()->id,
            'sub_total' => $sub_total / Country()->currancy_value,
            'discount' => $discount / Country()->currancy_value,
            'discount_percentage' => 0,
            'vat' => ($sub_total / 100 * setting('vat')) / Country()->currancy_value,
            'vat_percentage' => setting('vat'),
            'coupon' => $coupon['discount_amount'] ?? 0,
            'coupon_percentage' => 0,
            'charge_cost' => $delivery_cost/ Country()->currancy_value,
            'coins_value' => $coins_value,
            'net_total' => ((($sub_total + $vat + $delivery_cost) / Country()->currancy_value) - ($coupon_discount ?? 0)) - $coins_value,

        ]);

        foreach ($Cart as $key => $CartItem) {
            $SelectedItem = $CartItem->Device->Items->when($CartItem->item_id, function ($query) use($CartItem) {
                                return $query->where('id', $CartItem->item_id);
                            })->first() ?? $CartItem->Device;
            $Order->Devices()->attach($CartItem->device->id, [
                'item_id' => $CartItem->item_id,
                'office_id' => $CartItem->office_id,
                'protection_id' => $CartItem->protection_id,
                'color_id' => $CartItem->color_id > 0 ? $CartItem->color_id : null,
                'price' => $SelectedItem->Calcprice() / Country()->currancy_value,
                'quantity' => $CartItem->quantity,
                'total' => ($SelectedItem->Calcprice() * $CartItem->quantity) / Country()->currancy_value,
            ]);
            $CartItem->Device->Items()->when($CartItem->item_id, function ($query) use($CartItem) {
                return $query->where('id', $CartItem->item_id);
            })->decrement('quantity', $CartItem->quantity) ?? Device::where('id', $CartItem->device->id)->decrement('quantity', $CartItem->quantity);
            if($request->payment_id == 1 || $request->payment_id == 6)
            $CartItem->delete();
        }


        if($request->payment_id == 1 || $request->payment_id == 6){
            
            WhatsApp::SendOrder($Order->id);
            try {
                // Generate PDF
                // Generate PDF
                $data = ['Order' => $Order];
                $filename = md5($Order->id) . '.pdf';
                $pdfPath = 'Orders/' . $filename; // Relative path to public storage directory

                // Generate PDF and save it
                $pdf = \Mccarlosen\LaravelMpdf\Facades\LaravelMpdf::loadView('emails.order_summary', $data)->output();

                // Store the PDF using Storage
                $storedPath =  Storage::disk('public')->put($pdfPath, $pdf);

                if ($storedPath) {
                    $fullPdfPath = storage_path('app/public/' . $pdfPath);

                    Mail::to([$Client->email])->send(new OrderSummary($Order,$fullPdfPath));
                    Mail::to([setting('email')])->send(new OrderSummary($Order,$fullPdfPath));
                }

            } catch (\Throwable $th) {
                return 'error: '.$th->getMessage();
            }
            
            if($request->payment_id == 6){
                Client::where('id', $Client->id)->decrement('wallet',$Order->net_total);
            }
            alert()->success(__('trans.order_added_successfully'));
    
            return redirect()->route('Client.home');
        }else{
            $Order->status = 5;
            $Order->save();
            $OrderTapController = new \App\Http\Controllers\Payment\OrderTapController();
            return redirect()->away($OrderTapController->VerifyTapTransaction($Order->id));
        }
    }

    public function coupon(Request $request)
    {
        $coupon = Coupon::where('code', $request->coupon_code)->first();

        if ($coupon == null || $coupon->status == 'pending' || $coupon->status == 'inactive' || $coupon->valid_from > Carbon::now() || $coupon->valid_to < Carbon::now() || $coupon->max_uses == 0)
        {
            return response()->json([
                'success' => true,
                'type' => 'info',
                'message' => __('trans.invalidCoupon'),
            ]);
        }

        return response()->json([
            'success' => true,
            'type' => 'success',
            'message' => __('trans.validCoupon'),
            'coupon' => $coupon,
        ]);
    }

    public function confirm(Request $request)
    {
       return redirect()->route('Client.confirmPage',$request->delivery_id);
    }

    public function confirmPage(Request $request)
    {
        $Cart = Cart::where('client_id', client_id())->with('Device', 'Color')->get();
        $Regions = Region::where('country_id',ship_to())->orderBy('title_'.lang())->get();
        return view('Client.confirm', compact('Cart','Regions'));
    }


    public function cart()
    {
        $Cart = Cart::where('client_id', client_id())->with('Device', 'Color')->get();

        return view('Client.cart', compact('Cart'));
    }

    public function deleteitem()
    {
        Cart::where('client_id', client_id())->where('id', request('id'))->delete();
        $cart_count = Cart::where('client_id', client_id())->count();

        return response()->json([
            'success' => true,
            'type' => 'success',
            'cart_count' => $cart_count,
            'message' => __('trans.DeletedSuccessfully'),
        ]);
    }

    public function minus()
    {
        if (request('count')) {
            Cart::where('client_id', client_id())->where('id', request('id'))->update(['quantity' => request('count')]);
            $cart_count = Cart::where('client_id', client_id())->count();

            return response()->json([
                'success' => true,
                'type' => 'success',
                'cart_count' => $cart_count,
                'message' => __('trans.updatedSuccessfully'),
            ]);
        } else {
            $cart_count = Cart::where('client_id', client_id())->count();

            return response()->json([
                'success' => false,
                'type' => 'error',
                'cart_count' => $cart_count,
                'message' => __('trans.sorry_there_was_an_error'),
            ]);
        }
    }

    public function plus()
    {
        $CartItem = Cart::where('client_id', client_id())->where('id', request('id'))->first();
        $DeviceQuantity = Device::where('id', $CartItem->device_id)->select('quantity')->value('quantity');
        if ($DeviceQuantity > 0) {
            if ($CartItem->quantity < $DeviceQuantity) {
                Cart::where('id', $CartItem->id)->increment('quantity', 1);
            } else {
                return response()->json([
                    'success' => false,
                    'type' => 'error',
                    'message' => __('trans.quantityNotenough'),
                ]);
            }
        } else {
            return response()->json([
                'success' => false,
                'type' => 'error',
                'message' => __('trans.quantityNotenough'),
            ]);
        }

        $cart_count = Cart::where('client_id', client_id())->count();

        return response()->json([
            'success' => true,
            'type' => 'success',
            'cart_count' => $cart_count,
            'message' => __('trans.updatedSuccessfully'),
        ]);
    }

    public function AddToCart(Request $request)
    {
        $device_id = $request->device_id;
        $color_id = $request->color_id ?? null;
        $quantity = $request->quantity ?? 1;
        $DeviceQuantity = Device::where('id', $device_id)->select('quantity')->value('quantity');

        if ($DeviceQuantity > 0) {
            $CartItem = Cart::where('client_id', client_id())->where('device_id', $device_id)->where('color_id', $color_id)->first();
            if ($CartItem) {
                if ($CartItem->quantity < $DeviceQuantity) {
                    if ($CartItem->color_id == $color_id) {
                        Cart::where('id', $CartItem->id)->increment('quantity', 1);
                    } else {
                        Cart::insert([
                            'client_id' => client_id(),
                            'device_id' => $device_id,
                            'color_id' => $color_id,
                            'quantity' => $quantity,
                        ]);
                    }
                } else {
                    return response()->json([
                        'success' => false,
                        'type' => 'error',
                        'message' => __('trans.quantityNotenough'),
                    ]);
                }
            } else {
                Cart::insert([
                    'client_id' => client_id(),
                    'device_id' => $device_id,
                    'color_id' => $color_id,
                    'quantity' => $quantity,
                ]);
            }
        } else {
            return response()->json([
                'success' => false,
                'type' => 'error',
                'message' => __('trans.quantityNotenough'),
            ]);
        }

        $cart_count = Cart::where('client_id', client_id())->count();

        return response()->json([
            'success' => true,
            'type' => 'success',
            'cart_count' => $cart_count,
            'message' => __('trans.addedSuccessfully'),
        ]);
    }

    public function ToggleWishlist(Request $request)
    {
        $device_id = $request->device_id;

        if (DB::table('wishlist')->where('client_id', client_id())->where('device_id', $device_id)->exists()) {
            DB::table('wishlist')->where('client_id', client_id())->where('device_id', $device_id)->delete();

            return response()->json([
                'success' => true,
                'type' => 'success',
                'exists' => 0,
                'message' => __('trans.DeletedSuccessfully'),
            ]);
        } else {
            DB::table('wishlist')->insert([
                'client_id' => client_id(),
                'device_id' => $device_id,
            ]);

            return response()->json([
                'success' => true,
                'type' => 'success',
                'exists' => 1,
                'message' => __('trans.addedSuccessfully'),
            ]);
        }
    }

    public function contact(Request $request)
    {
        Contact::create($request->all());
        toast(__('trans.We Will Contact You as soon as possible'), 'success');

        return back();
    }
}
