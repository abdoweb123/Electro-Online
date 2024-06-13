@extends('Client.layouts.layout')
@section('content')

<div class="container container-fluid mt-5 mb-5">
    <div class="d-flex justify-content-between">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item" ><a class="second_link" href="{{ route('Client.home') }}">@lang('trans.home')</a></li>
                <li class="breadcrumb-item active" aria-current="page">@lang('trans.forgetPassword')</li>
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
                <form action="{{route('Client.forget')}}" method="POST" id="forget-form" style="display:contents">
                    @csrf
                    <div class="my-1">
                        <h1>@lang('trans.forgetPassword')</h1>
                        <div class="form-group">
                            <label for="email" class="form-label">@lang('trans.email')</label>
                            <input class="form-control" type="tel" name="email" id="email"  autocomplete="off" />
                        </div>
                        <div class="form-group d-none">
                            <label for="password" class="form-label">@lang('trans.password')</label>
                            <input class="form-control" type="password" id="password" id="password" name="password" autocomplete="off" />
                        </div>
                        <input class="btn main_btn w-100 mx-auto my-3" type="submit" id="forget" value="@lang('trans.Submit')" />
                        <p>@lang('trans.haveAccount') <a href="{{ route('Client.login') }}" class="second_link text-decoration-none my_foot_link transition_me">@lang('trans.login')</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>



<div class="modal fade" id="Verify" tabindex="-1" aria-labelledby="VerifyLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
       <div class="modal-content">
          <div class="modal-header">
                <h5 class="modal-title">@lang('trans.Verify_email')</h5>
          </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="code" class="form-label">@lang('trans.code')</label>
                    <input class="form-control" type="text" id="code" minlength="6" maxlength="6">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">@lang('trans.close')</button>
                <button type="button" class="btn px-2 py-1 main_btn" id="verifPhNum">@lang('trans.Submit')</button>
            </div>
       </div>
    </div>
 </div>


 @endsection

 @push('js')
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <script>
     verified = false;
     code = null;
     $(document).on("click", "#verifPhNum", function (event) {
        if(code == $('#code').val()){
            verified = true;
            // $('#email').closest('.form-group').addClass('d-none');
            $('#password').closest('.form-group').removeClass('d-none');
            $('.modal').modal('hide');
        }
     });
     $(document).on("click", "#forget", function (event) {
        event.preventDefault();
        email = $('#email').val();
        if(verified == false){
             if($('#email').val().length == 0 || !validateEmail($('#email').val())){
{{--                 toast('error',"{{ __('validation.required',['attribute'=>__('trans.email')]) }}")--}}
                    Swal.fire({
                        icon: 'error',
                        // title: 'Error',
                        text: "{{ __('validation.required', ['attribute' => __('trans.email')]) }}",
                        confirmButtonColor: '{{setting('main_color')}}', // Change button color
                    });
             }else if(verified == false){
                 if (code) {
                     toast('success',"{{ __('trans.Verify_email') }}");
                 }else{
                     $.ajax({
                         url: "/sendotp",
                         dataType: "json",
                         type: "POST",
                         async: true,
                         data: {
                            'email': email,
                            'forget': true,
                         },
                         headers: {
                             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                         },
                         success: function (data) {
                             if(data.code){
                                $('.modal').modal('show');
                                 toast('success',"{{ __('trans.Verify_email') }}");
                                 code = data.code;
                             }else{
                                 {{--toast('error',"{{ __('trans.This Email is not registered before!') }}");--}}
                                 Swal.fire({
                                     icon: 'error',
                                     // title: 'Error',
                                     text: "{{ __('validation.required', ['attribute' => __('trans.This Email is not registered before!')]) }}",
                                     confirmButtonColor: '{{setting('main_color')}}', // Change button color
                                 });
                             }
                         }
                     });
                 }
             }
        }else if($('#password').val().length == 0){
{{--                 toast('error',"{{ __('validation.required',['attribute'=>__('trans.password')]) }}")--}}
            Swal.fire({
                icon: 'error',
                // title: 'Error',
                text: "{{ __('validation.required', ['attribute' => __('trans.password')]) }}",
                confirmButtonColor: '{{setting('main_color')}}', // Change button color
            });

        }else if(verified == true){
             $('#forget-form').submit();
         }
     });
     
     function validateEmail(email) {
        // Regular expression for email validation
        var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return regex.test(email);
    }
 </script>


 @endpush
 
 