@extends('Admin.layout')

@section('pagetitle', __('trans.coupons'))

@section('content')

    <div class="row">
        <div class="my-2 col-6 text-sm-start">
            <a href="{{ route('Admin.coupons.create') }}" class="main-btn">@lang('trans.add_new')</a>
        </div>
    </div>

    <table class="table table-bordered data-table mt-5 text-center">
        <thead>
        <tr>
            <th>@lang('trans.code')</th>
            <th>@lang('trans.description')</th>
            <th>@lang('trans.amount')</th>
            <th>@lang('trans.time_from')</th>
            <th>@lang('trans.time_to')</th>
            <th>@lang('trans.max_uses')</th>
            <th>@lang('trans.time')</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        @foreach ($Models as $Model)
            <tr>
                <td>
                    @if($Model->status == 'active')
                        <i style="color:green" class="mx-2 fa-solid fa-circle"></i>
                    @elseif($Model->status == 'inactive')
                        <i style="color:red" class="mx-2 fa-solid fa-circle"></i>
                    @elseif($Model->status == 'pending')
                        <i style="color:yellow" class="mx-2 fa-solid fa-circle"></i>
                    @endif
                    {{ $Model->code }}
                </td>
                <td>{!! $Model['description'] !!}</td>
                <td>
                    {{ $Model->discount_amount }} %
                </td>
                <td>{{ $Model->valid_from }}</td>
                <td>{{ $Model->valid_to }}</td>
                <td>{{ $Model->max_uses }}</td>
                <td>{{ $Model['created_at'] }}</td>
                <td>
                    <a href="{{ route('Admin.coupons.edit', $Model) }}" class="mx-4"><i class="fa-solid fa-pen-to-square"></i></a>
                    <form class="formDelete" method="POST" action="{{ route('Client.address.destroy', $Model) }}">
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
