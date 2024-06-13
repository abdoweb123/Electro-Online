@extends('Admin.layout')

@section('pagetitle', __('trans.countries'))
@section('content')

<div class="row">
    <div class="my-2 col-12 col-md-6">
        <a href="{{ route('admin.countries.create') }}" class="main-btn btn-hover text-center mx-auto px-5">@lang('trans.add_new') <i class="fa-solid fa-plus mx-1"></i></a>
    </div>

</div>
<table class="table dataTable  data-table" >
    <thead>
        <tr>
            <th>#</th>
            <th>@lang('trans.title_ar')</th>
            <th>@lang('trans.title_en')</th>
            <th>@lang('trans.image')</th>
            <th>@lang('trans.status')</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        @foreach ($Countries as $Country)
        <tr>
            <td>{{ $loop->iteration }}</td>
            <td><a target="_blank" href="{{ route('admin.countries.show', $Country) }}">{{ $Country->title_ar }}</a></td>
            <td><a target="_blank" href="{{ route('admin.countries.show', $Country) }}">{{ $Country->title_en }}</a></td>
            <td><img src="{{ asset($Country->image) }}" style="max-width: 80px"></td>
            <td>
                <input class="toggle" type="checkbox" onclick="toggleswitch({{ $Country->id }},'countries')" @if ($Country->status) checked @endif>
            </td>
            <td>
                <a href="{{ route('admin.countries.edit', $Country) }}"><i class="fa-solid fa-pen-to-square"></i></a>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>

@endsection
