@extends('Client.layouts.layout')
@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-md-9">

            <div class="about_us my-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12 col-md-6">
                            <div>
                                <img src="{{ asset(setting('about_image') ?? setting('logo')) }}"
                                    style="max-width: 100%">
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div>
                                {!! setting('about_' . lang()) !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

@endsection