@extends('Admin.layout')
@section('pagetitle', __('trans.coupons'))
@section('content')
    <form action="{{ route('Admin.coupons.store') }}" method="post">
        @csrf
        <div class="row my-1">
            <div class="col-md-6 form-group">
                <label for="code" class="form-label">@lang('trans.coupon')</label>
                <input class="form-control w-100" required type="text" id="code" name="code" autocomplete="off"/>
            </div>
            <div class="col-md-6 form-group">
                <label for="amount" class="form-label">@lang('trans.amount') (%)</label>
                <div class="input-group mb-2 mr-sm-2">
                    <input class="form-control" required type="number" id="amount" name="discount_amount" autocomplete="off" min="0"/>
                </div>
            </div>
            <div class="col-md-6 form-group">
                <div class="form-group">
                    <label for="valid_from">@lang('trans.time_from')</label>
                    <input type="datetime-local" class="form-control" name="valid_from" id="valid_from" placeholder="@lang('trans.time_from')">
                </div>
            </div>
            <div class="col-md-6 form-group">
                <div class="form-group">
                    <label for="valid_to">@lang('trans.time_to')</label>
                    <input type="datetime-local" class="form-control" name="valid_to" id="valid_to" placeholder="@lang('trans.time_to')">
                </div>
            </div>
            <div class="col-md-6 form-group">
                <div class="form-group">
                    <label for="max_uses">@lang('trans.max_uses')</label>
                    <input class="form-control w-100" required type="number" id="max_uses" name="max_uses" step="1" min="1"/>
                </div>
            </div>
            <div class="col-md-6 form-group">
                <div class="form-group">
                    <label for="max_uses">@lang('trans.clients')</label>
                    <select name="client_id" class="form-control custom-select" required>
                        <option value="" selected>----</option>
                        @foreach($clients as $client)
                            <option value="{{$client->id}}">{{$client->name ?? $client->email}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="col-md-6 form-group">
                <label for="desc" class="form-label">@lang('trans.desc')</label>
                <textarea class="form-control w-100" required id="desc" name="description" autocomplete="off"></textarea>
            </div>
            <div class="col-md-6 form-group">
                <div class="form-group">
                    <label for="status">@lang('trans.status')</label>
                    <div class="row">
                        <div class="col-4">
                            <input type="radio" id="pending" name="status" value="pending">
                            <label for="pending">@lang('trans.pending_status')</label>
                        </div>
                        <div class="col-4">
                            <input type="radio" id="active" name="status" value="active">
                            <label for="active">@lang('trans.active_status')</label>
                        </div>
                        <div class="col-4">
                            <input type="radio" id="inactive" name="status" value="inactive">
                            <label for="inactive">@lang('trans.inactive_status')</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="button-group my-4">
                    <button type="submit" class="main-btn btn-hover w-100 text-center float-end">
                        {{ __('trans.Submit') }}
                    </button>
                </div>
            </div>
        </div>
    </form>
@endsection

@push('js')
    <script>
        const now = new Date();
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0');
        const day = String(now.getDate()).padStart(2, '0');
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        const nowFormatted = `${year}-${month}-${day}T${hours}:${minutes}`;
        $('#valid_to').attr('min', nowFormatted);
    </script>
@endpush
