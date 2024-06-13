@extends('Client.layouts.layout')
@section('content')

<div class="container container-fluid mt-5 mb-5">
    <div class="d-flex justify-content-between">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('Client.home') }}" class="second_link">@lang('trans.home')</a></li>
                <li class="breadcrumb-item active" aria-current="page">@lang('trans.login')</li>
            </ol>
        </nav>
    </div>
    <div class="container">
        <div class="row align-items-center">
            <div class="col-12 col-md-6 text-center">
                <div class="mt-4">
                    <img src="{{ asset(setting('logo')) }}" class="img-fluid footer-logoimg" alt="image">
                </div>
            </div>
            <div class="col-12 col-md-6 d-flex justify-content-center">   
                <form action="{{route('Client.login')}}" method="POST" style="width: 400px;">
                    @csrf
                    <div>
                        <h1>@lang('trans.login')</h1>
                    </div>
                    <div class="my-1">
                        <div class="form-group">
                            <label for="email" class="form-label">@lang('trans.email')</label>
                            <input type="email" name="email" id="email" class="form-control w-100"  placeholder="@lang('trans.email')" autocomplete="off" />
                        </div>
                        <div class="form-group">
                            <label for="password" class="form-label">@lang('trans.password')</label>
                            <input type="password" name="password" class="form-control"  placeholder="@lang('trans.password')" autocomplete="off" />
                        </div>
                        <div class="form-group d-flex justify-content-between my-2">
                            <label class="checkbox-wrap checkbox-primary"><input type="checkbox" class="mx-1" checked>@lang('trans.remember')</label>
                            <a href="{{ route('Client.forget') }}" class="second_link">@lang('trans.forgetPassword')</a>
                        </div>
                        <input class="btn main_btn w-100 mx-auto my-3" type="submit" value="@lang('trans.login')" />
                    </div>
                    <p>@lang('trans.dontHaveAccount') <a href="{{ route('Client.register') }}" class="second_link my-2">@lang('trans.register')</a></p>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
