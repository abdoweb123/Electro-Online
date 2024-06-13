<div class="header">
    <h4>@lang('trans.currentOrders')</h4>
</div>
@if(CurrentOrders()->count())
<div id="accordion" class="{{ lang() == 'ar' ? 'text-right' : '' }}">
    @foreach(CurrentOrders() as $key => $Order)

       @include('Client.layouts.order-tab',['Order'=>$Order])

    @endforeach
</div>
@else
    <div class="col-12 text-center">
        <h4 class="p-4 m-0">@lang('trans.noOrders')</h4>
    </div>
@endif

<div class="header mt-5">
    <h4>@lang('trans.previousOrders')</h4>
</div>
@if(PreviousOrders()->count())
<div id="accordion" class="{{ lang() == 'ar' ? 'text-right' : '' }}">
    @foreach(PreviousOrders() as $key => $Order)

       @include('Client.layouts.order-tab',['Order'=>$Order])

    @endforeach
</div>
@else
    <div class="col-12 text-center">
        <h4 class="p-4 m-0">@lang('trans.noOrders')</h4>
    </div>
@endif