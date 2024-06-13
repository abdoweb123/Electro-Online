<div class="header">
    <h4>@lang('trans.WISHLIST')</h4>
</div>
@forelse (Wishlist() as $Device)
    <div class="col-12 col-md-6 col-lg-4 p-0">
        @include('Client.layouts.singledevice',['Device'=>$Device])
    </div>
@empty
    <div class="text-center">
        <img src="{{ asset('assets/img/empty.png') }}" alt="empty">
        <h3>@lang('trans.empty_products')</h3>
    </div>
@endforelse