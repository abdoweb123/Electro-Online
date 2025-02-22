@extends('Admin.layout')
@section('pagetitle', __('trans.devices'))
@section('content')

<form method="POST" action="{{ route('admin.devices.update',$Device) }}" enctype="multipart/form-data" >
    @csrf
    @method('PUT')
    <div class="row">
        <div class="col-md-6">
            <label for="title_ar">@lang('trans.title_ar')</label>
            <input type="text" name="title_ar" required placeholder="@lang('trans.title_ar')" class="form-control" value="{{ $Device['title_ar'] }}">
        </div>
        <div class="col-md-6">
            <label for="title_en">@lang('trans.title_en')</label>
            <input type="text" name="title_en" required placeholder="@lang('trans.title_en')" class="form-control" value="{{ $Device['title_en'] }}">
        </div>
        <div class="col-md-6">
            <label for="quantity">@lang('trans.quantity')</label>
            <input type="number" min="0" name="quantity" value="{{ $Device['quantity'] }}" required placeholder="@lang('trans.quantity')" class="form-control">
        </div>
        <div class="col-md-6">
            <label for="price">@lang('trans.price')</label>
            <input type="number" min="0" name="price" value="{{ $Device['price'] }}" required placeholder="@lang('trans.price')" class="form-control">
        </div>

        <div class="col-md-6">
            <label class="form-label">@lang('trans.brand')</label>
            <select class="form-control" id="brand_id" name="brand_id">
                <option value="" selected disabled hidden>----------</option>
                @foreach ($Brands as $Item)
                    <option @selected($Item->id == $Device['brand_id']) value="{{ $Item->id }}">{{ $Item->title() }}</option>
                @endforeach
            </select>
        </div>

        <div class="col-md-6">
            <label >
                <span>@lang('trans.isThereDiscount')</span>
            </label>
            <select id="discountDiscount" name="have_discount" class="form-control">
                <option {{  $Device->discount_value > 0 ? 'selected' : '' }} value="1">@lang('trans.yes')</option>
                <option {{  $Device->discount_value > 0 ? '' : 'selected' }} value="0">@lang('trans.no')</option>
            </select>
        </div>
        <div class="col-md-6 discount {{  $Device->discount_value <= 0 ? 'hide' : '' }}">
            <label >@lang('trans.discount') <span class="h4">%</span></label>
            <input value="{{ $Device->discount_value }}" id="discount" type="number" step="any" min="0" max="100" name="discount_value" placeholder="@lang('trans.discount')" class="form-control">
        </div>
        <div class="col-md-6 discount {{  $Device->discount_value <= 0 ? 'hide' : '' }}">
            <label >@lang('trans.discount_from')</label>
            <input value="{{ $Device->discount_from }}" id="discount_from" type="datetime-local" name="discount_from" placeholder="@lang('trans.discount_from')" class="form-control">
        </div>
        <div class="col-md-6 discount {{  $Device->discount_value <= 0 ? 'hide' : '' }}">
            <label >@lang('trans.discount_to')</label>
            <input value="{{ $Device->discount_to }}" id="discount_to" type="datetime-local" name="discount_to" placeholder="@lang('trans.discount_to')" class="form-control">
        </div>

        <hr style="color: transparent">

        <div class="col-md-6">
            <label for="header" class="form-label">@lang('trans.header')</label>
            <input class="form-control" name="header" type="file">
        </div>

        <div class="col-md-6 d-flex justify-content-center">
            <div class="position-relative" style="width: fit-content;">
                @if ($Device->header)
                
                    @if(IsVideo($Device->header))
                        <video class="preview_image" src="{{ asset($Device->header) }}" autoplay /></video>  
                    @else
                        <img class="preview_image" src="{{ asset($Device->header) }}" />            
                    @endif
                @endif
            </div>
        </div>

        
        <hr style="color: transparent">
        
        <div class="col-md-6">
            <label >@lang('trans.Gallery')</label>
            <input class="form-control"  accept="image/jpg, image/png, image/gif, image/jpeg,  image/webp, image/avif" multiple type="file" name="gallery[]">
        </div>
        <div class="row d-flex justify-content-center my-2">

        </div>
        <div class="row d-flex justify-content-center my-2">
            @foreach ($Device->Gallery as $item)
                @if ($item->image)    
                    <div class="position-relative" style="width: fit-content;">
                        <input type="hidden" name="old_gallery[]" value="{{ $item->image }}">
                        <img class="preview_image" style="max-width: 100px;" src="{{ $item->image }}"/>
                        <i data-path="{{ $item->image }}" class="position-absolute cursor-pointer fa-regular fa-circle-xmark text-danger" style="right:0px"></i>
                    </div>
                @endif
            @endforeach
        </div>

        <div class="col-md-6">
            <label >@lang('trans.build_device')</label>
            <div class="row">
                <div class="col-md-3 text-start">
                    <input type="radio" name="build_device" value="1" {{$Device->build_device == 1 ? 'checked' : ''}}> @lang('trans.yes')
                </div>

                <div class="col-md-3 text-start">
                    <input type="radio" name="build_device" value="0" {{$Device->build_device == 0 ? 'checked' : ''}}> @lang('trans.no')
                </div>
            </div>
        </div>

        
        <hr style="color: transparent">

        <div class="my-3" style="width: 100%; height: 20px; border-bottom: 1px solid black; text-align: center">
            <span style="font-size: 15px; background-color: #fff; padding: 0 10px;">
                <h2 >@lang('trans.categories')</h2>
            </span>
        </div>
        <div class="col-md-6">
            <label class="form-label">@lang('trans.parent')</label>
            <select class="form-control selectpicker" data-live-search="true" id="parent_id">
                <option value="" selected disabled hidden>----------</option>
                @foreach ($Categories as $Item)
                    <option value="{{ $Item->id }}">{{ $Item->title() }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-md-6">
            <label class="form-label">@lang('trans.category')</label>
            <select class="form-control selectpicker" data-live-search="true" id="category_id" name="categories[]">
        
            </select>
        </div>
        <div class="col-12 my-2" style="display: flex;justify-content: space-evenly;">
            @foreach ($Device->Categories as $Category)
                <div class="position-relative" style="width: fit-content;"><input name="categories[]" type="hidden" value="{{ $Category->id }}">
                    <button type="button" class="btn btn-dark">{{ $Category->Parent->title() }} -> {{ $Category->title() }}</button>
                    <i data-path="" class="position-absolute cursor-pointer fa-regular fa-circle-xmark text-danger" style="right:0px"></i>
                </div>
            @endforeach
        </div>


        <div class="my-3" style="width: 100%; height: 20px; border-bottom: 1px solid black; text-align: center">
            <span style="font-size: 15px; background-color: #fff; padding: 0 10px;">
                <h2 >@lang('trans.type')</h2>
            </span>
        </div>
        <div class="col-6 my-2" style="display: flex;justify-content: space-evenly;">
            <select class="form-control selectpicker" multiple data-live-search="true" id="type_id" name="type_ids[]">
                <option value="" disabled hidden>----------</option>
                @foreach ($types as $type)
                    <option value="{{ $type->id }}" {{ in_array($type->id, $Device->types->pluck('id')->toArray()) ? 'selected' : '' }}>
                        {{ $type['title_'.lang()] }}
                    </option>
                @endforeach
            </select>
        </div>

        
        <hr style="color: transparent" class="my-4">
        
        <div  class="my-5"  style="width: 100%; height: 20px; border-bottom: 1px solid black; text-align: center">
            <span style="font-size: 15px; background-color: #fff; padding: 0 10px;">
                <h2>@lang('trans.items')</h2>
            </span>
        </div>
        <div class="row border-0 my-3">
            @foreach($Device->Items as $Item)
                <div class="row items_block position-relative my-3 border border-dark">
                    <div class="col-md-6">
                        <label for="items[{{ $loop->index }}][size_id]">@lang("trans.size")</label>
                        <select class="form-control" id="items[{{ $loop->index }}][size_id]" name="items[{{ $loop->index }}][size_id]">
                            @foreach(Sizes() as $size)
                                <option @selected($Item->size_id ==  $size->id) value="{{ $size->id }}">{{ $size->title() }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label fo="#items[{{ $loop->index }}][memory_id]">@lang("trans.memory")</label>
                        <select class="form-control" id="items[{{ $loop->index }}][memory_id]" name="items[{{ $loop->index }}][memory_id]">
                            @foreach(Memories() as $memory)
                                <option @selected($Item->memory_id ==  $memory->id) value="{{ $memory->id }}">{{ $memory->title() }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="items[{{ $loop->index }}][color_id]">@lang("trans.color")</label>
                        <select class="form-control" id="items[{{ $loop->index }}][color_id]" name="items[{{ $loop->index }}][color_id]">
                            @foreach(Colors() as $color)
                                <option @selected($Item->color_id ==  $color->id) value="{{ $color->id }}">{{ $color->title() }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="items[{{ $loop->index }}][storage_id]">@lang("trans.storage")</label>
                        <select class="form-control" id="items[{{ $loop->index }}][storage_id]" name="items[{{ $loop->index }}][storage_id]">
                            @foreach(Storages() as $storage)
                                <option @selected($Item->storage_id ==  $storage->id) value="{{ $storage->id }}">{{ $storage->title() }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="items[{{ $loop->index }}][processor_id]">@lang("trans.processor")</label>
                        <select class="form-control" id="items[{{ $loop->index }}][processor_id]" name="items[{{ $loop->index }}][processor_id]">
                            @foreach(Processors() as $processor)
                                <option @selected($Item->processor_id ==  $processor->id) value="{{ $processor->id }}">{{ $processor->title() }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="items[{{ $loop->index }}][os]">@lang("trans.os")</label>
                        <select class="form-control" id="items[{{ $loop->index }}][os]" name="items[{{ $loop->index }}][os]">
                            @foreach(OS() as $OS_Item)
                                <option @selected($Item->os_id ==  $OS_Item->id) value="{{ $OS_Item->id }}">{{ $OS_Item->title() }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="quantity">@lang("trans.quantity")</label>
                        <input type="text" min="0"  value="{{ $Item->quantity }}" name="items[{{ $loop->index }}][quantity]" placeholder="@lang("trans.quantity")" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label for="price">@lang("trans.price")</label>
                        <input type="number" step="0.01" min="0" value="{{ $Item->price }}" name="items[{{ $loop->index }}][price]" placeholder="@lang("trans.price")" class="form-control">
                    </div>
                    <button class="btn btn-danger position-absolute remove_items text-center mx-auto" style="width: 35px;{{ lang("en") ? "right" : "left" }}: 0px;top: 40%;" type="button">-</button>
                    <hr class="my-2">
                </div>
            @endforeach
            <div class="items_block"></div>
            <div class="col-md-1 mx-auto text-center">
                <button class="main-btn add_items text-center mx-auto" type="button">+</button>
            </div>
        </div>

        <hr style="color: transparent">

        <div class="col-md-6 col-sm-12">
            <label >@lang('trans.short_desc_ar')</label>
            <textarea rows="8" name="short_desc_ar" placeholder="@lang('trans.short_desc_ar')" class="form-control mceNoEditor">{!! $Device['short_desc_ar'] !!}</textarea>
        </div>
        <div class="col-md-6 col-sm-12">
            <label >@lang('trans.short_desc_en')</label>
            <textarea rows="8" name="short_desc_en" placeholder="@lang('trans.short_desc_en')" class="form-control mceNoEditor">{!! $Device['short_desc_en'] !!}</textarea>
        </div>

        <div class="col-md-12 col-sm-12">
            <label >@lang('trans.long_desc_ar')</label>
            <textarea rows="8" name="long_desc_ar" placeholder="@lang('trans.long_desc_ar')" class="form-control" cols="9">{!! $Device['long_desc_ar'] !!}</textarea>
        </div>
        <div class="col-md-12 col-sm-12">
            <label >@lang('trans.long_desc_en')</label>
            <textarea rows="8" name="long_desc_en" placeholder="@lang('trans.long_desc_en')" class="form-control" cols="9">{!! $Device['long_desc_en'] !!}</textarea>
        </div>

        
        <hr style="color: transparent">

                
        <div style="width: 100%; height: 20px; border-bottom: 1px solid black; text-align: center">
            <span style="font-size: 15px; background-color: #fff; padding: 0 10px;">
                <h2>@lang('trans.accessories')</h2>
            </span>
        </div>
        <div class="col-md-6">
            <label for="accessories" class="form-label">@lang('trans.accessories')</label>
            <select class="form-control" id="accessories" name="have_accessories">
                <option @selected($Device->Accessories->count() == 0) value="0">{{ __('trans.No') }}</option>
                <option @selected($Device->Accessories->count() > 0) value="1">{{ __('trans.yes') }}</option>
            </select>
        </div>

        <div class="col-12 accessories {{ $Device->Accessories->count() ? '' : 'hide' }}">
            <div class="row accessories_block">
                <div class="col-md-3">
                    <label class="form-label">@lang('trans.parent')</label>
                    <select class="form-control selectpicker" data-live-search="true" id="accessories_parent_id">
                        <option value="" selected>----------</option>
                        @foreach ($Categories as $Item)
                            <option value="{{ $Item->id }}">{{ $Item->title() }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label">@lang('trans.category')</label>
                    <select class="form-control selectpicker" data-live-search="true" id="accessories_category_id">
                        
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label">@lang('trans.device')</label>
                    <select class="form-control selectpicker" data-live-search="true" id="accessories_product_id">
                        
                    </select>
                </div>
                <div class="col-md-1 text-center">
                    <label class="form-label w-100">@lang('trans.add')</label>
                    <button class="main-btn add_accessory text-center mx-auto" type="button">+</button>
                </div>
            </div>
            <div class="row py-2 text-center d-flex justify-content-center">
                @foreach ($Device->Accessories as $item)
                    <div class="position-relative" style="width: fit-content;"><input name="accessories[]" type="hidden" value="{{ $item->id }}">
                        <button type="button" class="btn btn-dark">{{ $item->title() }}</button>
                        <i data-path="" class="position-absolute cursor-pointer fa-regular fa-circle-xmark text-danger" style="right:0px"></i>
                    </div>
                @endforeach
            </div>
        </div>

        <hr style="color: transparent">

        <div style="width: 100%; height: 20px; border-bottom: 1px solid black; text-align: center">
            <span style="font-size: 15px; background-color: #fff; padding: 0 10px;">
                <h2>@lang('trans.features')</h2>
            </span>
        </div>
        @if ($Device->Features->count())
            @foreach ($Device->Features as $Feature)
                <div class="row features_block position-relative">
                    <div class="col-md-6">
                        <label for="title_ar">@lang("trans.title_ar")</label>
                        <input type="text" name="features[{{ $Feature->id }}][title_ar]" value="{{ $Feature->title_ar }}" placeholder="@lang("trans.title_ar")" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label for="title_en">@lang("trans.title_en")</label>
                        <input type="text" name="features[{{ $Feature->id }}][title_en]" value="{{ $Feature->title_en }}" placeholder="@lang("trans.title_en")" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label for="image" class="form-label">@lang("trans.image")</label>
                        <input type="hidden" name="features[{{ $Feature->id }}][old_image]" placeholder="@lang('trans.title_en')" value="{{ $Feature->image }}">
                        <input class="form-control"  name="features[{{ $Feature->id }}][image]"  accept="image/jpg, image/png, image/gif, image/jpeg,  image/webp, image/avif" type="file" data-feature-id="{{ $Feature->id }}">
                    </div>
                    <div class="col-md-6">
                        <div class="position-relative" style="width: fit-content;">
                            <img class="preview_image" src="{{ $Feature->image }}"/>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <label >@lang("trans.desc_ar")</label>
                        <textarea rows="7" name="features[{{ $Feature->id }}][desc_ar]" placeholder="@lang("trans.desc_ar")" class="form-control mceNoEditor">{!! $Feature->desc_ar !!}</textarea>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <label >@lang("trans.desc_en")</label>
                        <textarea rows="7" name="features[{{ $Feature->id }}][desc_en]" placeholder="@lang("trans.desc_en")" class="form-control mceNoEditor">{!! $Feature->desc_en !!}</textarea>
                    </div>
                    <button class="btn btn-danger position-absolute remove_features text-center mx-auto" style="width: 35px;{{ lang("en") ? "right" : "left" }}: 0px;top: 40%;" type="button">-</button>
                </div>
            @endforeach
        @else
            <div class="row features_block position-relative">
                <div class="col-md-6">
                    <label for="title_ar">@lang('trans.title_ar')</label>
                    <input type="text" name="features[0][title_ar]" placeholder="@lang('trans.title_ar')" class="form-control">
                </div>
                <div class="col-md-6">
                    <label for="title_en">@lang('trans.title_en')</label>
                    <input type="text" name="features[0][title_en]" placeholder="@lang('trans.title_en')" class="form-control">
                </div>
                <div class="col-md-6">
                    <label for="image" class="form-label">@lang('trans.image')</label>
                    <input class="form-control"  name="features[0][image]" accept="image/jpg, image/png, image/gif, image/jpeg,  image/webp, image/avif" type="file" data-feature-id="0">
                </div>
                <div class="col-md-6">
                </div>
                <div class="col-md-6 col-sm-12">
                    <label >@lang('trans.desc_ar')</label>
                    <textarea rows="7" name="features[0][desc_ar]" placeholder="@lang('trans.desc_ar')" class="form-control mceNoEditor"></textarea>
                </div>
                <div class="col-md-6 col-sm-12">
                    <label >@lang('trans.desc_en')</label>
                    <textarea rows="7" name="features[0][desc_en]" placeholder="@lang('trans.desc_en')" class="form-control mceNoEditor"></textarea>
                </div>
                <button class="btn btn-danger position-absolute remove_features text-center mx-auto" style="width: 35px;{{ lang("en") ? "right" : "left" }}: 0px;top: 40%;" type="button">-</button>
            </div>
    
        @endif


        <div class="row features_block border-0">
            <div class="col-md-1 mx-auto text-center">
                <label class="form-label w-100">@lang('trans.add')</label>
                <button class="main-btn add_features text-center mx-auto" type="button">+</button>
            </div>
        </div>

        <hr style="color: transparent">

        <div style="width: 100%; height: 20px; border-bottom: 1px solid black; text-align: center">
            <span style="font-size: 15px; background-color: #fff; padding: 0 10px;">
                <h2>@lang('trans.specs')</h2>
            </span>
        </div>
        <div class="row pt-5">
            <div class="col-12">
                <div class="row">
                    <div class="col-md-6">
                        <label for="specs" class="form-label">@lang('trans.specs')</label>
                        <select class="form-control" id="specs" name="specs">
                            <option value="" selected disabled hidden>----------</option>
                            @foreach (Specs() as $Item)
                            <option value="{{ $Item->id }}">{{ $Item->title() }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label w-100">@lang('trans.add')</label>
                        <button class="main-btn add_specs text-center mx-auto" type="button">+</button>
                    </div>
                </div>
            </div>
            <div class="col-12" id="specs_block">
                @foreach ($Device->Specs as $item)           
                    <div class="row specs_block position-relative">
                        <div class="col-md-12 text-center">
                            <h4 for="specs">{{ $item->title() }}</h4>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <label >@lang("trans.desc_ar")</label>
                            <textarea rows="7" name="specs[{{ $item->pivot->specs_id }}][desc_ar]" placeholder="@lang("trans.desc_ar")" class="form-control mceNoEditor">{{ $item->pivot->desc_ar }}</textarea>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <label >@lang("trans.desc_en")</label>
                            <textarea rows="7" name="specs[{{ $item->pivot->specs_id }}][desc_en]" placeholder="@lang("trans.desc_en")" class="form-control mceNoEditor">{{ $item->pivot->desc_en }}</textarea>
                        </div>
                        <button class="btn btn-danger position-absolute remove_specs text-center mx-auto" style="width: 35px;{{ lang("en") ? "right" : "left" }}: 0%;top: 50%;" type="button">-</button>
                    </div>
                @endforeach
            </div>
        </div>


        <div class="col-12">
            <div class="button-group my-4">
                <button type="submit" class="main-btn btn-hover w-100 text-center">
                    {{ __('trans.Submit') }}
                </button>
            </div>
        </div>
    </div>
</form>
@endsection



@section('css')
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
    <style>
        .features_block {
            border: 1px solid #CCC;
            margin: 10px 0px;
            padding: 10px 0px;
        }
    </style>
@endsection



@section('js')
    <script src="https://unpkg.com/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

    <script>
        features_i = 9999;
        items_i = 9999;
        $(".selectpicker").selectpicker();
        $(document).on('click', '#selectAll', function() {
            $('#permissions option').attr("selected", "selected");
            $(".selectpicker").selectpicker('refresh');
        });
        $(document).on('change', 'input[type="file"]', function() {
            var Preview = $(this).parent().next();
            Preview.empty();
            files = this.files;
            if (files && files.length > 0) {
                for (var i = 0; i < files.length; i++) {
                    file = files[i];
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        const fileType = file.type;
                        if (fileType.startsWith('image/')) {
                            var image = $("<img>").attr("src", e.target.result);
                            image.addClass("preview_image");
                            Preview.append(image);
                        } else if (fileType.startsWith('video/')) {
                            var video = $("<video>").attr("src", e.target.result);
                            video.addClass("preview_image");
                            Preview.append(video);
                        } else {
                          console.log('Unknown file type.');
                        }
                    };
                    reader.readAsDataURL(file);
                }
            }
        });
        $(document).on('change', '#discountDiscount', function() {
            if ($(this).val() === '1') {
                $('.discount').removeClass('hide');
            } else {
                $('.discount').addClass('hide');
                $('#discount').val('');
                $('#discount_from').val('');
                $('#discount_to').val('');
            }
        });
        $(document).on("change", "#accessories_parent_id", function() {
            $('select#accessories_product_id').empty();
            $('select#accessories_category_id').empty();
            $('select#accessories_category_id').append( '<option value="" selected disabled hidden>----------</option>' );
            $.each(@json($Categories), function (key,ParentCategory) {
                if($('#accessories_parent_id').find("option:selected").val() == ParentCategory['id']){
                    $.each(ParentCategory['children'], function (key,Category) {
                        $('select#accessories_category_id').append( '<option value="'+Category['id']+'">'+Category['title_{{ lang() }}']+'</option>' );
                    });
                }
            });
            $(".selectpicker").selectpicker('refresh');
        });
        $(document).on("change", "#accessories_category_id", function() {
            $('select#accessories_product_id').empty();
            $('select#accessories_product_id').append( '<option value="" selected disabled hidden>----------</option>' );
            $.each(@json($Categories), function (key,ParentCategory) {
                if($('#accessories_parent_id').find("option:selected").val() == ParentCategory['id']){
                    $.each(ParentCategory['children'], function (key,Category) {
                        if($('#accessories_category_id').find("option:selected").val() == Category['id']){
                            $.each(Category['devices'], function (key,Product) {
                                $('select#accessories_product_id').append( '<option value="'+Product['id']+'">'+Product['title_{{ lang() }}']+'</option>' );
                            });
                        }
                    });
                }
            });
            $(".selectpicker").selectpicker('refresh');
        });
        $(document).on('click', '.add_accessory', function() {
            exist = 0;
            $.each($('input[name="accessories[]"]'), function(key, item) {
                exist += $('#accessories_product_id').find("option:selected").val() == item.value ? 1 : 0
            });
            if (exist == 0 && $('#accessories_parent_id').find("option:selected").val() && $('#accessories_category_id').find("option:selected").val() && $('#accessories_product_id').find("option:selected").val()) {
                $(this).parent().parent().next().append(
                    '<div class="position-relative" style="width: fit-content;"><input name="accessories[]" type="hidden" value="'+ $('#accessories_product_id').find("option:selected").val() +'">'+
                        '<button type="button" class="btn btn-dark">'+ $('#accessories_product_id').find("option:selected").text() +'</button>'+
                        '<i data-path="" class="position-absolute cursor-pointer fa-regular fa-circle-xmark text-danger" style="right:0px"></i>'+
                    '</div>'
                );
            }
            $('select#accessories_category_id').empty();
            $('select#accessories_parent_id').find('option:eq(0)').prop('selected', true);
            $('select#accessories_product_id').empty();
            $(".selectpicker").selectpicker('refresh');
        });
        $(document).on('change', '#accessories', function() {
            if ($(this).val() == 1) {
                $('.accessories').removeClass('hide');
            }else if ($(this).val() == 0) {
                $('.accessories').addClass('hide');
            }
        });
        $(document).on('click', '.add_features', function() {
            $('<div class="row features_block position-relative">'+
                '<div class="col-md-6">'+
                    '<label for="title_ar">@lang("trans.title_ar")</label>'+
                    '<input type="text" name="features['+features_i+'][title_ar]" placeholder="@lang("trans.title_ar")" class="form-control">'+
                '</div>'+
                '<div class="col-md-6">'+
                    '<label for="title_en">@lang("trans.title_en")</label>'+
                    '<input type="text" name="features['+features_i+'][title_en]" placeholder="@lang("trans.title_en")" class="form-control">'+
                '</div>'+
                '<div class="col-md-6">'+
                    '<label for="image" class="form-label">@lang("trans.image")</label>'+
                    '<input class="form-control"  accept="image/jpg, image/png, image/gif, image/jpeg,  image/webp, image/avif" type="file" data-feature-id="'+features_i+'">'+
                '</div>'+
                '<div class="col-md-6 preview_images">'+
                '</div>'+
                '<div class="col-md-6 col-sm-12">'+
                    '<label >@lang("trans.desc_ar")</label>'+
                    '<textarea rows="7" name="features['+features_i+'][desc_ar]" placeholder="@lang("trans.desc_ar")" class="form-control mceNoEditor"></textarea>'+
                '</div>'+
                '<div class="col-md-6 col-sm-12">'+
                    '<label >@lang("trans.desc_en")</label>'+
                    '<textarea rows="7" name="features['+features_i+'][desc_en]" placeholder="@lang("trans.desc_en")" class="form-control mceNoEditor"></textarea>'+
                '</div>'+
                '<button class="btn btn-danger position-absolute remove_features text-center mx-auto" style="width: 35px;{{ lang("en") ? "right" : "left" }}: 0px;top: 40%;" type="button">-</button>'+
            '</div>'
            ).insertBefore('.features_block:last');
            features_i++;
        });
        $(document).on('click', '.remove_features', function() {
            $(this).parent().remove();
        });






        $(document).on('click', '.add_items', function() {
            $('<div class="row items_block position-relative my-3 border border-dark">'+
                '<div class="col-md-6">'+
                '<label for="items['+items_i+'][size_id]">@lang("trans.size")</label>'+
                '<select class="form-control" id="items['+items_i+'][size_id]" name="items['+items_i+'][size_id]"></select>'+
                '</div>'+
                '<div class="col-md-6">'+
                '<label fo="#items['+items_i+'][memory_id]">@lang("trans.memory")</label>'+
                '<select class="form-control" id="items['+items_i+'][memory_id]" name="items['+items_i+'][memory_id]"></select>'+
                '</div>'+
                '<div class="col-md-6">'+
                '<label for="items['+items_i+'][color_id]">@lang("trans.color")</label>'+
                '<select class="form-control" id="items['+items_i+'][color_id]" name="items['+items_i+'][color_id]"></select>'+
                '</div>'+
                '<div class="col-md-6">'+
                '<label for="items['+items_i+'][storage_id]">@lang("trans.storage")</label>'+
                '<select class="form-control" id="items['+items_i+'][storage_id]" name="items['+items_i+'][storage_id]"></select>'+
                '</div>'+
                '<div class="col-md-6">'+
                '<label for="items['+items_i+'][processor_id]">@lang("trans.processor")</label>'+
                '<select class="form-control" id="items['+items_i+'][processor_id]" name="items['+items_i+'][processor_id]"></select>'+
                '</div>'+
                '<div class="col-md-6">'+
                '<label for="items['+items_i+'][os]">@lang("trans.os")</label>'+
                '<select class="form-control" id="items['+items_i+'][os]" name="items['+items_i+'][os]"></select>'+
                '</div>'+
                '<div class="col-md-6">'+
                '<label for="quantity">@lang("trans.quantity")</label>'+
                '<input type="text" min="0"  name="items['+items_i+'][quantity]" placeholder="@lang("trans.quantity")" class="form-control">'+
                '</div>'+
                '<div class="col-md-6">'+
                '<label for="price">@lang("trans.price")</label>'+
                '<input type="number" step="0.01" min="0" name="items['+items_i+'][price]" placeholder="@lang("trans.price")" class="form-control">'+
                '</div>'+
                '<button class="btn btn-danger position-absolute remove_items text-center mx-auto" style="width: 35px;{{ lang("en") ? "right" : "left" }}: 0px;top: 40%;" type="button">-</button>'+
                '<hr class="my-2">'+
                '</div>'
            ).insertAfter('.items_block:last');

            $.each(@json(Sizes()), function (key,Item) {
                $('select[name="items['+items_i+'][size_id]"]').append( '<option value="'+Item['id']+'">'+Item['title_{{ lang() }}']+'</option>' );
            });
            $.each(@json(Memories()), function (key,Item) {
                $('select[name="items['+items_i+'][memory_id]"]').append( '<option value="'+Item['id']+'">'+Item['title_{{ lang() }}']+'</option>' );
            });
            $.each(@json(Colors()), function (key,Item) {
                $('select[name="items['+items_i+'][color_id]"]').append( '<option value="'+Item['id']+'">'+Item['title_{{ lang() }}']+'</option>' );
            });
            $.each(@json(Storages()), function (key,Item) {
                $('select[name="items['+items_i+'][storage_id]"]').append( '<option value="'+Item['id']+'">'+Item['title_{{ lang() }}']+'</option>' );
            });
            $.each(@json(Processors()), function (key,Item) {
                $('select[name="items['+items_i+'][processor_id]"]').append( '<option value="'+Item['id']+'">'+Item['title_{{ lang() }}']+'</option>' );
            });
            $.each(@json(OS()), function (key,Item) {
                $('select[name="items['+items_i+'][os]"]').append( '<option value="'+Item['id']+'">'+Item['title_{{ lang() }}']+'</option>' );
            });
            features_i++;
        });
        $(document).on('click', '.remove_items', function() {
            $(this).parent().remove();
        });
        
        
        
        
        
        
        
        
        
        
        
        $(document).on('click', '.add_specs', function() {
            $('#specs_block').append(
                '<div class="row specs_block position-relative">'+
                    '<div class="col-md-12 text-center">'+
                        '<h4 for="specs">'+$('select[name="specs"]').find("option:selected").text()+'</h4>'+
                    '</div>'+
                    '<div class="col-md-6 col-sm-12">'+
                        '<label >@lang("trans.desc_ar")</label>'+
                        '<textarea rows="7" name="specs['+ $('select[name="specs"]').find("option:selected").val() +'][desc_ar]" placeholder="@lang("trans.desc_ar")" class="form-control mceNoEditor"></textarea>'+
                    '</div>'+
                    '<div class="col-md-6 col-sm-12">'+
                        '<label >@lang("trans.desc_en")</label>'+
                        '<textarea rows="7" name="specs['+ $('select[name="specs"]').find("option:selected").val() +'][desc_en]" placeholder="@lang("trans.desc_en")" class="form-control mceNoEditor"></textarea>'+
                    '</div>'+
                    '<button class="btn btn-danger position-absolute remove_specs text-center mx-auto" style="width: 35px;{{ lang("en") ? "right" : "left" }}: 0%;top: 50%;" type="button">-</button>'+
                '</div>'
            );
        });
        $(document).on('click', '.remove_specs', function() {
            $(this).parent().remove();
        });
        $(document).on("change", "#parent_id", function() {
            SubCat();
        });
        $(document).on("change", "#category_id", function() {
            $(this).parent().parent().next().append('<div class="position-relative" style="width: fit-content;"><input name="categories[]" type="hidden" value="' + $( "#category_id option:selected" ).val() + '"><button type="button" class="btn btn-dark">'+ $( "#category_id option:selected" ).attr('data-parent') +' -> '+ $( "#category_id option:selected" ).text() +'</button><i data-path="" class="position-absolute cursor-pointer fa-regular fa-circle-xmark text-danger" style="right:0px"></i></div>');
            SubCat();
        });
        $(document).on('click', '.fa-circle-xmark', function() {
            item = $(this);
            item.parent().remove();
            SubCat();
        });
        function SubCat() {
            $('select#category_id').empty();
            $('select#category_id').append('<option value="" selected>----------</option>');
            $.each(@json($Categories), function(key, ParentCategory) {
                if ($('#parent_id').find("option:selected").val() == ParentCategory['id']) {
                    $.each(ParentCategory['children'], function(key, Category) {
                        exist = 0;
                        $.each($('input[name="categories[]"]'), function(key, item) {
                            exist += Category['id'] == item.value ? 1 : 0
                        });
                        if(exist == 0){
                            console.log(Category['id']);
                            $('select#category_id').append('<option data-parent="' + Category['parent']['title_{{ lang() }}'] + '" value="' + Category['id'] + '">' + Category['title_{{ lang() }}'] + '</option>');
                        }
                    });
                }
            });
            $(".selectpicker").selectpicker('refresh');
        }
    </script>

@endsection
