@extends('Admin.layout')
@section('pagetitle')
    <a href="{{ route('admin.type.show',$Model->type_id) }}" style="color:blue">{{ $Model->type['title_'.lang()] }}</a>/{{ __('trans.type_items') }}
@stop
@section('content')

<table class="table">
    <div class="text-center">
        <img src="{{ asset($Model->file ?? setting('logo')) }}" class="rounded mx-auto text-center" id="file"  height="200px">
    </div>
    <tr>
        <td class="text-center">
           @lang('trans.title_ar'): {{ $Model['title_ar'] }}
        </td>
        <td class="text-center">
           @lang('trans.title_en'): {{ $Model['title_en'] }}
        </td>
        <td class="text-center">
            @lang('trans.price'): {{ $Model['price'] }}
        </td>
    </tr>
    <tr>
        <td class="text-center">
            @lang('trans.desc_ar'): {!! $Model['desc_ar'] !!}
        </td>
        <td class="text-center">
            @lang('trans.desc_en'): {!! $Model['desc_en'] !!}
        </td>
    </tr>
</table>

@endsection

