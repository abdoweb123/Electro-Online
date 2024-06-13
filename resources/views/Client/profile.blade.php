@extends('Client.layouts.layout')
@section('content')

<div class="container container-fluid mt-5 mb-5">
    <div class="d-flex justify-content-between">
        <nav aria-label="breadcrumb" class="d-flex align-items-center justify-content-between w-100">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('Client.home') }}" class="second_link">@lang('trans.home')</a></li>
                <li class="breadcrumb-item active" aria-current="page">@lang('trans.profile')</li>
            </ol>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><i class="fa-solid fa-sliders h3 mx-1 main_color point" data-bs-toggle="offcanvas" data-bs-target="#toggle" aria-controls="toggle" aria-label="Toggle navigation"></i></li>
            </ol>
        </nav>
    </div>
    <div class="row">
        @if ((request('type') == 'info') || request('type') == null )
            
            @include('Client.profile.info')
            
        @elseif (request('type') == 'addresses')
        
            @include('Client.profile.addresses')

        @elseif (request('type') == 'orders')
            
            @include('Client.profile.orders')

        @elseif (request('type') == 'wishlist')
        
            @include('Client.profile.wishlist')

        @elseif (request('type') == 'coupon')

            @include('Client.profile.coupon')
            
        @elseif (request('type') == 'wallet')
        
            @include('Client.profile.wallet')
            
        @elseif (request('type') == 'chat')
        
            @include('Client.profile.chat')
            
        @elseif (request('type') == 'coins')
        
            @include('Client.profile.coins')
                    
            
        @endif
    </div>
</div>



<nav class="navbar fixed-top">
    <div class="container-fluid">
        <div class="offcanvas offcanvas-{{ lang('ar') ? 'end' : 'start' }}" tabindex="-1" id="toggle" aria-labelledby="toggleLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="toggleLabel">{{ setting('title_'.lang()) }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="sidebar-nav">
                    <li class="@if ((request('type') == 'info') || request('type') == null ) active @endif">
                        <a href="{{ route('Client.profile') }}/info">@lang('trans.Account Info')</a>
                    </li>
                    <li class="@if (request('type') == 'orders') active @endif">
                        <a href="{{ route('Client.profile') }}/orders">@lang('trans.My Orders')</a>
                    </li>
                    <li class="@if (request('type') == 'coins') active @endif">
                        <a href="{{ route('Client.profile') }}/coins">@lang('trans.my_coins')</a>
                    </li>
                    <li class="@if (request('type') == 'chat') active @endif">
                        <a href="{{ route('Client.profile') }}/chat">@lang('trans.message-center')</a>
                    </li>
                    <li class="@if (request('type') == 'wallet') active @endif">
                        <a href="{{ route('Client.profile') }}/wallet">@lang('trans.wallet')</a>
                    </li>
                    <li class="@if (request('type') == 'wishlist') active @endif">
                        <a href="{{ route('Client.profile') }}/wishlist">@lang('trans.WISHLIST')</a>
                    </li>
                    <li class="@if (request('type') == 'coupon') active @endif">
                        <a href="{{ route('Client.profile') }}/coupon">@lang('trans.coupon')</a>
                    </li>
                    <li class="@if (request('type') == 'addresses') active @endif">
                        <a href="{{ route('Client.profile') }}/addresses">@lang('trans.My Addresses')</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

@endsection

@push('js')
<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("d-none");
        $("#wrapper").toggleClass("toggled");
    });
</script>
@endpush

@push('css')
<style>
    .sidebar-nav {
        position: absolute;
        width: 95%;
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .sidebar-nav li {
        text-indent: 20px;
        line-height: 40px;
    }

    .sidebar-nav li a {
        display: block;
        text-decoration: none;
        color: #999999;
    }

    .sidebar-nav li a:hover {
        text-decoration: none;
        color: #fff;
        background: rgba(255, 255, 255, 0.2);
    }

    .sidebar-nav li.active a,
    .sidebar-nav li a.active,
    .sidebar-nav li a:hover {
        color: #fff;
        background: #000;
        text-decoration: none;
    }
    
</style>
@endpush
