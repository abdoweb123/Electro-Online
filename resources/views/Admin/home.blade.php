@extends('Admin.layout')
@section('pagetitle',__('trans.dashboardTitle'))

@section('css')

 <style>
body {
    background-color: #f2f3fa;
  }
  .stats {
    margin: 5px;
  }
  .stats .col {
    margin: 0;
    padding: 3;
  }
  .statContainer {
    margin: 5px;
    width: 100%;
    font-size: 13px;
    border-radius: 3px;
    background-color: #fff;
    padding: 0;
    overflow: hidden;
  }
  .statContainer .title {
    padding: 5px 10px;
    color: #fff;
  }
  .statContainer.blue .title {
    background-color: {{setting('main_color')}};
    height: 80px;
  }
  .statContainer.blue .status {
    color: {{setting('main_color')}};
  }

  .statContainer.yellow .title {
    background-color: {{setting('main_color')}};
    height: 80px;
  }
  .statContainer.yellow .status {
    color: {{setting('main_color')}};
  }

  .statContainer.fountainBlue .title {
    background-color: #6abebf;
    height: 80px;
  }
  .statContainer.fountainBlue .status {
    color: #6abebf;
  }

  .statContainer.lightBlue .title {
    background-color: #52a1e5;
    height: 80px;
  }
  .statContainer.lightBlue .status {
    color: #52a1e5;
  }

  .statContainer.purple .title {
    background-color: #916df6;
    height: 80px;
  }
  .statContainer.purple .status {
    color: #916df6;
  }

  .statContainer.pink .title {
    background-color: #ef6e85;
    height: 80px;
  }
  .statContainer.pink .status {
    color: #ef6e85;
  }

  .statContainer.orange .title {
    background-color: #ff7043;
    height: 80px;
  }
  .statContainer.orange .status {
    color: #ff7043;
  }
  @media (max-width: 1200px) {
    .stats .col {
      min-width: 20% !important;
    }
  }

  @media (max-width: 887px) {
    .stats .col {
      min-width: 25% !important;
    }
  }
  @media (max-width: 768px) {
    .stats .col {
      min-width: 50% !important;
    }
  }
  @media (max-width: 525px) {
    .stats .col {
      min-width: 100% !important;
    }
  }
    </style>
@endsection

@section('content')

<!--<div class="text-center">-->
<!--    <img src="{{ asset(setting('logo')) }}" alt="Logo" style="max-width: 200px">-->
<!--    <h1>-->
<!--        @lang('trans.WelcomeBack')-->
<!--    </h1>-->
<!--</div>-->

    <div class="row">
        <div class="col-12 col-md-3 my-3">
            <a href="{{ route('admin.orders.index') }}" class="statLink my-2" style="all:unset; cursor: pointer; ">
                <div class="statContainer blue shadow-sm">
                    <div class="title text-center h4"><i class="fa-solid fa-arrow-up-wide-short mx-2"></i>@lang('trans.orders')</div>
                    <div class="d-flex" style="height: 60px;">
                        <div class="p-2 flex-fill text-center">@lang('trans.Total') <br></div>
                        <div class="p-2 flex-fill text-center status h4">{{ $orders_no }} <br></div>
                    </div>
                </div>
            </a>
        </div>
        
        <div class="col-12 col-md-3 my-3">
            <a href="{{ route('Admin.coupons.index') }}" class="statLink my-2" style="all:unset; cursor: pointer">
                <div class="statContainer blue shadow-sm">
                    <div class="title text-center h4"><i class="fa-solid fa-arrow-up-wide-short mx-2"></i>@lang('trans.coupons')</div>
                    <div class="d-flex" style="height: 60px;">
                        <div class="p-2 flex-fill text-center">@lang('trans.Total') <br></div>
                        <div class="p-2 flex-fill text-center status h4">{{ $coupons_no }} <br></div>
                    </div>
                </div>
            </a>
        </div>
        
        <div class="col-12 col-md-3 my-3">
            <a href="{{ route('admin.categories.index') }}" class="statLink my-2" style="all:unset; cursor: pointer">
                <div class="statContainer blue shadow-sm">
                    <div class="title text-center h4"><i class="fa-solid fa-clone mx-2"></i>@lang('trans.categories')</div>
                    <div class="d-flex" style="height: 60px;">
                        <div class="p-2 flex-fill text-center">@lang('trans.Total') <br></div>
                        <div class="p-2 flex-fill text-center status h4">{{ $categories_no }} <br></div>
                    </div>
                </div>
            </a>
        </div>
        
        <div class="col-12 col-md-3 my-3">
            <a href="{{ route('admin.devices.index') }}" class="statLink my-2" style="all:unset; cursor: pointer">
                <div class="statContainer blue shadow-sm">
                    <div class="title text-center h4"><i class="fa-solid fa-laptop-code mx-2"></i>@lang('trans.devices')</div>
                    <div class="d-flex" style="height: 60px;">
                        <div class="p-2 flex-fill text-center">@lang('trans.Total') <br></div>
                        <div class="p-2 flex-fill text-center status h4">{{ $devices_no }} <br></div>
                    </div>
                </div>
            </a>
        </div>
        
        <div class="col-12 col-md-3 my-3">
            <a href="{{ route('admin.services.index') }}" class="statLink my-2" style="all:unset; cursor: pointer">
                <div class="statContainer blue shadow-sm">
                    <div class="title text-center h4"><i class="fa-solid fa-icons mx-2"></i>@lang('trans.services')</div>
                    <div class="d-flex" style="height: 60px;">
                        <div class="p-2 flex-fill text-center">@lang('trans.Total') <br></div>
                        <div class="p-2 flex-fill text-center status h4">{{ $services_no }} <br></div>
                    </div>
                </div>
            </a>
        </div>
        
        <div class="col-12 col-md-3 my-3">
            <a href="{{ route('admin.ads.index') }}" class="statLink my-2" style="all:unset; cursor: pointer">
                <div class="statContainer blue shadow-sm">
                    <div class="title text-center h4"><i class="fa-solid fa-film mx-2"></i>@lang('trans.Ads')</div>
                    <div class="d-flex" style="height: 60px;">
                        <div class="p-2 flex-fill text-center">@lang('trans.Total') <br></div>
                        <div class="p-2 flex-fill text-center status h4">{{ $ads_no }} <br></div>
                    </div>
                </div>
            </a>
        </div>
        
        <div class="col-12 col-md-3 my-3">
            <a href="{{ route('admin.deliveries.index') }}" class="statLink my-2" style="all:unset; cursor: pointer">
                <div class="statContainer blue shadow-sm">
                    <div class="title text-center h4"><i class="fa-solid fa-truck mx-2"></i>@lang('trans.deliveries')</div>
                    <div class="d-flex" style="height: 60px;">
                        <div class="p-2 flex-fill text-center">@lang('trans.Total') <br></div>
                        <div class="p-2 flex-fill text-center status h4">{{ $deliveries_no }} <br></div>
                    </div>
                </div>
            </a>
        </div>
        
        
    </div>
    
@endsection


















