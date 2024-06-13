<form action="{{route('Client.profile')}}" method="POST" id="profile-form" enctype="multipart/form-data">
    @csrf
    <div class="header">
        <h4>@lang('trans.Account Info')</h4>
    </div>

    <div class="row my-1">
        <div class="col-md-12 form-group text-center">
            <input class="d-none" type="file" id="file"  name="image" onchange="document.getElementById('image').src = window.URL.createObjectURL(this.files[0])">
            <div class="text-center mx-auto" style="position: relative;width: min-content;">
                <label for="file">
                    <img src="{{ asset(auth('client')->user()->image ?? 'avatar.png') }}" id="image" style="width: 200px;height: 200px;" class="rounded-circle mx-auto text-center"  height="200px">
                </label>
                <label for="file">
                    <i  style="position: absolute;font-size: 33px;bottom: 20px;right: 0px;;color: var(--main--color);" class="fa-solid fa-pen-to-square"></i>
                </label>
            </div>
        </div>
        <div class="col-md-6 form-group">
            <label for="name" class="form-label">@lang('trans.name')</label>
            <input class="form-control" required type="text" id="name" value="{{ auth('client')->user()->name }}" name="name" class="w-100" autocomplete="off" />
        </div>
        <div class="col-md-6 form-group">
            <label for="email" class="form-label">@lang('trans.email')</label>
            <input class="form-control" type="email" id="email" value="{{ auth('client')->user()->email }}" name="email" class="w-100" autocomplete="off" />
        </div>
        <div class="col-md-6 form-group">
            <label for="password" class="form-label">@lang('trans.password')</label>
            <input class="form-control" type="password" id="password" name="password" autocomplete="off" />
        </div>
        <div class="col-md-6 form-group">
            <label for="password_confirmation" class="form-label">@lang('trans.confirmPassword')</label>
            <input class="form-control" type="password" id="password_confirmation" name="password_confirmation" autocomplete="off" />
        </div>
        <div class="col-md-12 form-group text-center">
            <button class="btn main_btn w-50 mx-auto my-3" type="submit" id="profile">@lang('trans.update')</button>
        </div>
       
    </div>
</form>
