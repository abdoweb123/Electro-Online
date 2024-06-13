@extends('Admin.layout')
@section('pagetitle')
    <a href="{{ route('admin.type.show',$Model->type_id) }}" style="color:blue">{{ $Model->type['title_'.lang()] }}</a>/{{ __('trans.type_items') }}
@stop
@section('content')
<form method="POST" action="{{ route('admin.typeItems.update',$Model) }}" enctype="multipart/form-data" >
    @csrf
    @method('PUT')
    <input type="hidden" name="">
    <div class="text-center">
        <img src="{{ asset($Model->file ?? setting('logo')) }}" class="rounded mx-auto text-center" id="file"  height="200px">
    </div>
    <div class="row">
        <div class="col-md-6">
            <label for="title_ar">@lang('trans.title_ar')</label>
            <input id="title_ar" type="text" name="title_ar" required placeholder="@lang('trans.title_ar')" class="form-control" value="{{ $Model['title_ar'] }}">
        </div>
        <div class="col-md-6">
            <label for="title_en">@lang('trans.title_en')</label>
            <input id="title_en" type="text" name="title_en" required placeholder="@lang('trans.title_en')" class="form-control" value="{{ $Model['title_en'] }}">
        </div>
        <div class="col-md-6 col-sm-12">
            <label for="file">{{ __('trans.file') }}</label>
            <input class="form-control w-100" id="file" type="file" name="file" onchange="document.getElementById('file').src = window.URL.createObjectURL(this.files[0])">
        </div>
        <div class="col-md-6 col-sm-12">
            <label for="file">{{ __('trans.price') }}</label>
            <input class="form-control w-100" type="number" step="any" name="price" value="{{ $Model['price'] }}" required>
        </div>

        <div class="col-md-6 col-sm-12">
            <label >@lang('trans.desc_ar')</label>
            <textarea rows="8" name="desc_ar" placeholder="@lang('trans.desc_ar')" class="form-control">{!! $Model['desc_ar'] !!}</textarea>
        </div>
        <div class="col-md-6 col-sm-12">
            <label >@lang('trans.desc_en')</label>
            <textarea rows="8" name="desc_en" placeholder="@lang('trans.desc_en')" class="form-control">{!! $Model['desc_en'] !!}</textarea>
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
