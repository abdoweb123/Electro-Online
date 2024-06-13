<div class="header">
    <h4>@lang('trans.myAddresses')</h4>
</div>
<div class="row my-4">
    @if(count(auth('client')->user()->addresses) > 0)
    <div class="col-12">
        @foreach(auth('client')->user()->Addresses as $Address)
        <div class="bg-light p-3 rounded mb-4 {{ lang() == 'ar' ? 'text-right' : '' }}">
            <ul class="my-3 list-unstyled">
                <li class="row my-3">
                    
                    @php($country_id = $Address->Region['country_id'])
                    <p class="col-12 col-md-6">
                        @if($country_id != 2)
                            @lang('trans.city')
                        @else
                            @lang('trans.region')
                        @endif
                        :
                        {{ $Address->Region->title() }}
                    </p>
                    <p class="col-12 col-md-6">
                        @if($country_id != 2)
                            @lang('trans.district')
                        @else
                            @lang('trans.block')
                        @endif
                        :
                        {{ $Address['block'] }}
                    </p>
                    <p class="col-12 col-md-6">
                        @if($country_id != 2)
                            @lang('trans.street')
                        @else
                            @lang('trans.road')
                        @endif
                        :
                        {{ $Address['road'] }}
                    </p>
                    <p class="col-12 col-md-6">
                        @lang('trans.building_floor')
                        :
                        {{ $Address['building_no'] }}
                    </p>
                    <p class="col-12 col-md-6">
                        @lang('trans.floor_no')
                        :
                        {{ $Address['floor_no'] }}
                    </p>
                    <p class="col-12 col-md-6">
                        @lang('trans.apartment')
                        :
                        {{ $Address['apartment'] }}
                    </p>
                    <p class="col-12 col-md-6">
                        @lang('trans.type')
                        :
                        {{ $Address['type'] }}
                    </p>
                    <p class="col-12 col-md-6">
                        @lang('trans.additional_directions')
                        :
                        {{ $Address['additional_directions'] }}
                    </p>
                </li>
            </ul>
            <div class="d-flex justify-content-end">
                <a href="{{ route('Client.address.edit', $Address['id']) }}" class="h5 text-decoration-none last_link transition-me mx-4"><i class="fa-solid fa-pen-to-square"></i></a>
                <form method="POST" action="{{ route('Client.address.destroy', $Address['id']) }}">
                    @csrf
                    @method('DELETE')
                    <button style="display: contents;color: red;" type="submit" class="show_confirm h5 text-decoration-none last_link transition-me mx-4 deleteAddress"><i class="fa-solid fa-trash"></i></button>
                </form>
            </div>
        </div>
        @endforeach
        <div class="my-4">
            <button onclick="location.href='{{ route('Client.address.create') }}'"  class="main_btn w-50 py-3 border-0 rounded"><i class="fa-solid fa-plus mx-2"></i>@lang('trans.addAddress')</button>
        </div>
    </div>
    @else
    <div class="col-12 text-center">
        <h4 class="p-4 m-0">@lang('trans.noSavedAddress')</h4>
        <div>
            <button onclick="location.href='{{ route('Client.address.create') }}'"  class="main_btn w-50 py-3 border-0 rounded">@lang('trans.addAddress')</button>
        </div>
    </div>
    @endif
</div>