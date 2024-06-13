@extends('Admin.layout')
@section('pagetitle', __('trans.type'))
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

