@extends('Admin.layout')

@section('pagetitle', __('trans.clients'))
@section('content')

<div class="row">
    <div class="my-2 col-6 text-sm-start">
        <a href="{{ route('admin.clients.create') }}" class="main-btn">@lang('trans.add_new')</a>
    </div>
</div>
<table class="table table-bordered data-table text-center" >
    <thead>
        <tr>
            <th>#</th>
            <th>@lang('Name')</th>
            <th>@lang('Phone')</th>
            <th>@lang('trans.allowchat')</th>
            <th>@lang('Email')</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        @foreach ($Models as $Model)

        @php($UnReaded = DB::table('chat')
            ->where('client_id', $Model->id)
            ->where('from', 'client')
            ->where('seen', 0)
            ->count())


        <tr Role="row" class="odd">
            <td>
                {{ $loop->iteration }}
                @if($UnReaded)
                    <i class="fa-solid fa-circle-dot text-danger"></i>
                @endif
            </td>
            <td>
                <a href="{{ route('admin.clients.show', $Model) }}"><i class="fa-brands fa-rocketchat mx-2"></i> {{ $Model->name }}</a>
            </td>
            <td>{{ $Model->phone }}</td>
            <td>
                <input class="toggle" type="checkbox" onclick="toggleswitch({{ $Model->id }},'clients', 'chat_status')" @if ($Model->chat_status) checked @endif>
            </td>
            <td>{{ $Model->email }}</td>
            <td>
                <a href="{{ route('admin.clients.edit', $Model) }}"><i class="fa-solid fa-pen-to-square"></i></a>
                <form class="formDelete" method="POST" action="{{ route('admin.clients.destroy', $Model) }}">
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
