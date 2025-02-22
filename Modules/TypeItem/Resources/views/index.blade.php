@extends('Admin.layout')

@section('pagetitle')
   <a href="{{ route('admin.type.show',$type->id) }}" style="color:blue">{{ $type['title_'.lang()] }}</a>/{{ __('trans.type_items') }}
@stop

@section('content')



<div class="row">
    <div class="my-2 col-6 text-sm-start">
        <a href="{{ route('admin.typeItems.create',$type->id) }}" class="main-btn">@lang('trans.add_new')</a>
    </div>
    <div class="my-2 col-6 text-sm-end">
        <button type="button" id="DeleteSelected" onclick="DeleteSelected('type_items')" class="btn btn-danger" disabled>@lang('trans.Delete_Selected')</button>
    </div>
</div>
<table class="table table-bordered data-table" >
    <thead>
        <tr>
            <th><input type="checkbox" id="ToggleSelectAll" class="main-btn"></th>
            <th>#</th>
            <th>@lang('trans.title_ar')</th>
            <th>@lang('trans.title_en')</th>
              <th>@lang('trans.price')</th>
            <th>@lang('trans.image')</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        @foreach ($Models as $Model)
        <tr>
            <td>
                <input type="checkbox" class="DTcheckbox" value="{{ $Model->id }}">
            </td>
            <td>{{ $loop->iteration }}</td>
            <td>{{ $Model->title_ar }}</td>
            <td>{{ $Model->title_en }}</td>
            <td>{{ $Model->price }}</td>
            <td class="text-center">
                <img src="{{ asset($Model->file ?? setting('logo')) }}" style="max-width: 100px;">
            </td>
            <td>
                <a href="{{ route('admin.typeItems.show', $Model) }}"><i class="fa-solid fa-eye"></i></a>
                <a href="{{ route('admin.typeItems.edit', $Model) }}"><i class="fa-solid fa-pen-to-square"></i></a>
                <form class="formDelete" method="POST" action="{{ route('admin.typeItems.destroy', $Model) }}">
                    @csrf
                    <input name="_method" type="hidden" value="DELETE">
                    <button type="button" class="btn btn-flat show_confirm" data-toggle="tooltip" title="Delete">
                        <i class="fa-solid fa-eraser"></i>
                    </button>
                </form>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>

@endsection
