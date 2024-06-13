<style>
    ul li {
        list-style-type: none;
    }
    *,a.dropdown-item {
        text-align: initial;
    }
</style>
<div style="color: #fff !important;background: var(--main--color);">
    <div class="container d-none d-lg-block">
        <div class="row align-items-center">
            <div class="col-md">
                <a class="navbar-brand me-0" href="{{ route('Client.home') }}">
                    <img src="{{ asset('logo.png') }}" alt="logo" style="max-width: 200px">
                </a>
            </div>
            <div class="col-md">
                <form action="{{ route('Client.categories') }}" class="d-flex flex-grow-1 position-relative" >
                    <input class="form-control me-2" type="search" name="search" placeholder="@lang('trans.search')" aria-label="Search">
                    <button class="btn third_border third_link position-absolute text-black" style="{{ lang('en') ? 'right' : 'left' }}: 10px;" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
            <div class="col-md">
                <ul class="d-flex my-auto">
                    <div class="dropdown">
                        @php
                            $ShipCountry = Countries()->where('id',ship_to())->first() ?? country();
                            $Currency = Countries()->where('id', currancy())->first();
                        @endphp
                        <span class="third_link dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="{{ asset($ShipCountry->image) }}" alt="logo" style="max-width: 20px"> {{ $Currency->currancy_code }}
                        </span>
                        <ul class="dropdown-menu p-2" style="z-index: 99;    min-width: 245px;">
                            <form method="post" action="{{ route('Client.set-data') }}">
                                @csrf
                                <div class="row">
                                    <div class="col-12 my-1">
                                        <label style="width: 100%;text-align: initial;" for="ship_to">@lang('trans.ShipTo')</label>
                                        <select class="form-control" id="ship_to" name="ship_to">
                                            @foreach(Countries() as $Country)
                                                <option value="{{ $Country->id }}" @selected(ship_to() == $Country->id)>
                                                    <img src="{{ asset($Country->image) }}" alt="logo" style="max-width: 20px"> {{ $Country->title() }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="col-12 my-1">
                                        <label style="width: 100%;text-align: initial;" for="lang">@lang('trans.language')</label>
                                        <select class="form-control" id="lang" name="lang">
                                            <option @selected(lang('en'))  value="en" href="{{ route('lang', 'en') }}" >English</option>
                                            <option @selected(lang('ar'))  value="ar" href="{{ route('lang', 'ar') }}" >العربية</option>
                                        </select>
                                    </div>
                                    <div class="col-12 my-1">
                                        <label style="width: 100%;text-align: initial;" for="currancy">@lang('trans.currancy')</label>
                                        <select class="form-control" id="currancy" name="currancy">
                                            @foreach(Countries() as $Country)
                                                <option value="{{ $Country->id }}" @selected(currancy() == $Country->id)>
                                                    <img src="{{ asset($Country->image) }}" alt="logo" style="max-width: 20px"> {{ $Country->currancy_code }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-12 my-1">
                                        <button type="submit" style="padding: 4px;" class="btn main_btn w-100">@lang('trans.save')</button>
                                    </div>
                                </div>
                            </form>
                        </ul>
                    </div>
                    <div class="dropdown">
                        <span class="third_link dropdown-toggle mx-2" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img alt="avatar" src="{{ auth('client')->user() ? asset(auth('client')->user()?->image) : asset('avatar.png') }}" width="25px" height="25px" class="mx-2 rounded-circle"> {{ auth('client')->user()->name ?? '' }}
                        </span>
                        <ul class="dropdown-menu"  style="z-index: 99;    min-width: 245px;">
                            @auth('client')
                                <li>
                                    <div class="d-grid gap-2 my-1 col-11 mx-auto">
                                        <div class="d-flex  align-items-center py-2">
                                            <div class="avatar avatar-md avatar-indicators avatar-online">
                                                <img alt="avatar" src="{{ asset(auth('client')->user()->image ?? asset('avatar.png')) }}" width="40px" height="40px" class="mx-2 rounded-circle">
                                            </div>
                                            <div class="ml-3 lh-1" style="font-size: 12px;">
                                                <p class="mb-1">
                                                    @lang('trans.WelcomeBack') <b>{{ explode(" ",auth('client')->user()->name)[0] }}</b>
                                                </p>
                                                <p class="mb-1 mt-3">
                                                    <a href="{{ route('Client.logout') }}" class="second_link" ><i class="fa-solid fa-right-from-bracket"></i> @lang('trans.logout')</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="d-grid gap-2 my-1 col-10 mx-auto">
                                        <a href="{{ route('Client.profile') }}" class="btn btn-dark" type="button"><i class="fa-regular fa-user"></i> @lang('trans.profile')</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="d-grid gap-2 my-1 col-10 mx-auto">
                                        <hr>
                                    </div>
                                </li>
                                <li>
                                    <div class="d-grid gap-2 my-1 col-10 mx-auto">
                                        <a href="{{ route('Client.profile') }}/orders" class="dropdown-item"><i class="fa-solid fa-file-circle-check"></i> @lang('trans.My Orders')</a>
                                    </div>
                                </li>

                                <li>
                                    <div class="d-grid gap-2 my-1 col-10 mx-auto">
                                        <a href="{{ route('Client.profile') }}/coins" class="dropdown-item"><i class="fa-solid fa-coins"></i> @lang('trans.my_coins')</a>
                                    </div>
                                </li>


                                <li>
                                    <div class="d-grid gap-2 my-1 col-10 mx-auto">
                                        <a href="{{ route('Client.profile') }}/chat" class="dropdown-item"><i class="fa-solid fa-comment"></i> @lang('trans.message-center')</a>
                                    </div>
                                </li>


                                <li>
                                    <div class="d-grid gap-2 my-1 col-10 mx-auto">
                                        <a href="{{ route('Client.profile') }}/wallet" class="dropdown-item"><i class="fa-solid fa-wallet"></i> @lang('trans.wallet')</a>
                                    </div>
                                </li>

                                <li>
                                    <div class="d-grid gap-2 my-1 col-10 mx-auto">
                                        <a href="{{ route('Client.profile') }}/wishlist" class="dropdown-item"><i class="fa-solid fa-heart"></i> @lang('trans.WISHLIST')</a>
                                    </div>
                                </li>

                                <li>
                                    <div class="d-grid gap-2 my-1 col-10 mx-auto">
                                        <a href="{{ route('Client.profile') }}/coupon" class="dropdown-item"><i class="fa-solid fa-wallet"></i> @lang('trans.coupon')</a>
                                    </div>
                                </li>


                                <li>
                                    <div class="d-grid gap-2 my-1 col-10 mx-auto">
                                        <a href="{{ route('Client.profile') }}/addresses" class="dropdown-item"><i class="fa-regular fa-user"></i> @lang('trans.My Addresses')</a>
                                    </div>
                                </li>

                            @else
                                <li>
                                    <div class="d-grid gap-2 my-1 col-10 mx-auto">
                                        <a href="{{ route('Client.login') }}" class="btn btn-dark" type="button"><i class="fa-regular fa-user"></i> @lang('trans.login')</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="d-grid gap-2 my-1 col-10 mx-auto">
                                        <a href="{{ route('Client.register') }}" class="btn btn-light" type="button"><i class="fa-regular fa-user"></i> @lang('trans.register')</a>
                                    </div>
                                </li>
                            @endauth
                        </ul>
                    </div>


                    <li><a href="{{ route('Client.cart') }}" class="third_link px-3"><i class="fa-solid fa-cart-shopping"></i>(<span id="cart_count">{{ cart_count() }}</span>)</a></li>

                </ul>
            </div>
        </div>
    </div>
    <div class="d-lg-none">
        <div class="mx-3 d-flex justify-content-between align-items-center">
            <a class="navbar-brand me-0" href="{{ route('Client.home') }}">
                <img src="{{ asset('logo.png') }}" alt="logo" style="max-width: 200px">
            </a>
            <a href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation" class=" d-lg-none third_link px-3"><i class="fa-solid fa-bars-staggered"></i></a>
        </div>
    </div>
</div>


<style>
    .nav-item-sm.active {
        border-left: 3px solid var(--main--color) !important;
        border-radius: 0px;
        padding: 5px;
    }
    .nav-item-sm.active .nav-link-sm, .nav-link-sm.active {
        padding: 0px;
        border-radius: 0px;
        background-color: transparent !important;
        color: var(--second--color) !important;
    }
</style>




<nav class="navbar fixed-top">
    <div class="container-fluid">
        <div class="offcanvas offcanvas-{{ lang('ar') ? 'end' : 'start' }}" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">{{ setting('title_'.lang()) }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">

                    @foreach (Categories()->where('children_count','>',0) as $Category)
                        <li class="nav-item nav-item-sm dropdown">
                            <a class="nav-link nav-link-sm {{ $Category->children_count ? 'dropdown-toggle' : '' }}" href="#" data-bs-toggle="dropdown">
                                {{ $Category->title() }}
                            </a>
                            <ul class="dropdown-menu border-0">
                                @foreach ($Category->children as $Children)
                                    <li><a class="dropdown-item" href="{{ route('Client.categories',['category'=>$Children->id]) }}">{{ $Children->title() }}</a></li>
                                @endforeach
                            </ul>
                        </li>
                    @endforeach

                    <li class="nav-item nav-item-sm">
                        <hr>
                    </li>

                    @auth('client')

                        <li class="nav-item nav-item-sm">
                            <a href="{{ route('Client.profile') }}" class="nav-link nav-link-sm" type="button"><i class="fa-regular fa-user"></i> @lang('trans.profile')</a>
                        </li>
                        <li class="nav-item nav-item-sm">
                            <a href="{{ route('Client.logout') }}" class="nav-link nav-link-sm" type="button"><i class="fa-solid fa-right-from-bracket"></i> @lang('trans.logout')</a>
                        </li>
                        <li class="nav-item nav-item-sm">
                            <hr>
                        </li>
                        <li class="nav-item nav-item-sm">
                            <a href="{{ route('Client.profile') }}/orders" class="nav-link nav-link-sm"><i class="fa-solid fa-file-circle-check"></i> @lang('trans.My Orders')</a>
                        </li>

                        <li class="nav-item nav-item-sm">
                            <a href="{{ route('Client.profile') }}/coins" class="dropdown-item"><i class="fa-solid fa-coins"></i> @lang('trans.my_coins')</a>
                        </li>

                        <li class="nav-item nav-item-sm">
                            <a href="{{ route('Client.profile') }}/chat" class="nav-link nav-link-sm"><i class="fa-solid fa-comment"></i> @lang('trans.message-center')</a>
                        </li>

                        <li class="nav-item nav-item-sm">
                            <a href="{{ route('Client.profile') }}/wallet" class="nav-link nav-link-sm"><i class="fa-solid fa-wallet"></i> @lang('trans.wallet')</a>
                        </li>

                        <li class="nav-item nav-item-sm">
                            <a href="{{ route('Client.profile') }}/wishlist" class="nav-link nav-link-sm"><i class="fa-solid fa-heart"></i> @lang('trans.WISHLIST')</a>
                        </li>

                        <li class="nav-item nav-item-sm">
                            <a href="{{ route('Client.profile') }}/coupon" class="dropdown-item"><i class="fa-solid fa-wallet"></i> @lang('trans.coupon')</a>
                        </li>

                        <li class="nav-item nav-item-sm">
                            <a href="{{ route('Client.profile') }}/addresses" class="nav-link nav-link-sm"><i class="fa-regular fa-user"></i> @lang('trans.My Addresses')</a>
                        </li>
                    @else
                        <li class="nav-item nav-item-sm">
                            <a href="{{ route('Client.login') }}" class="nav-link nav-link-sm" type="button"><i
                                        class="fa-regular fa-user"></i> @lang('trans.login')</a>
                        </li>
                        <li class="nav-item nav-item-sm">
                            <a href="{{ route('Client.register') }}" class="nav-link nav-link-sm" type="button"><i class="fa-regular fa-user"></i> @lang('trans.register')</a>
                        </li>
                    @endauth
                </ul>
            </div>
        </div>
    </div>
</nav>


<form action="{{ route('Client.categories') }}" >
    <div id="search-box">
        <div class="container">
            <a class="close" href="#close"></a>
            <div class="search-main">
                <div class="search-inner">
                    <input name="search" type="text" id="inputSearch" placeholder="">
                    <span class="search-info">Hit enter to search or ESC to close</span>
                </div>
            </div>
        </div>
    </div>
</form>

@push('js')
    <script>

        $('a[href="#search"]').click(function() {
            event.preventDefault()
            $("#search-box").addClass("-open");
            setTimeout(function() {
                inputSearch.focus();
            }, 800);
        });

        $('a[href="#close"]').click(function() {
            event.preventDefault()
            $("#search-box").removeClass("-open");
        });

        $(document).keyup(function(e) {
            if (e.keyCode == 27) {
                $("#search-box").removeClass("-open");
            }
        });
    </script>
@endpush
