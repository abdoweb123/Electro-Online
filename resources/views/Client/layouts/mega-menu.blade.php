
<style>
    /*********** Css Animation *********/
    #mega_menu {
        border: none;
        border-top: solid 1px #ebebeb;
        z-index: 9;
    }

    #mega_menu ul {
        list-style: none;
        padding: 0;
        margin: 0;
        text-align: left;
    }

    #mega_menu ul li {
        display: inline-block;
    }

    #mega_menu ul li a {
        color: #262626;
        font-size: 16px;
        display: block;
        text-decoration: none;
    }

    .main-category-title {
        padding: 0 10px;
    }

    #mega_menu ul li a {
        cursor: pointer;
    }

    /******** Sub menu *******/
    .mega-mostafa {
        position: absolute;
        transform: translateX(-50%) translateY(5%);
        padding: 20px 30px;
        border: 2px solid var(--main--color);
        display: none;
    }

    .dropdown-menu{
        top: 31px !important;
        padding: 10px !important;
    }



    .mega-mostafa {
        position: absolute;
        transform: translateX(-50%) translateY(5%);
        padding: 20px 30px;
        border: 2px solid var(--main--color);
        display: none;
    }

    .mega-mostafa::before {
        content: "";
        position: absolute;
        top: -10px; /* Adjust this to control the distance from the menu */
        left: 65%;
        transform: translateX(-50%);
        border-width: 10px;
        border-style: solid;
        border-color: transparent transparent var(--main--color) transparent;
    }


    .brand::before, .apple::before{
        left: 55%;
    }
</style>

<div class="container-fluid d-none d-lg-block">
    <!--	<div class="container">	--->
    <div class="row">

        <nav class="navbar" id="mega_menu">
            <ul class="mx-auto">
                <li><a href="{{ route('Client.home') }}">@lang('trans.home')</a></li>
                @foreach(NavCategories() as $Category)
                    <li>
                        <a class="main-category-title  dropdown-toggle"  data-bs-toggle="dropdown" aria-expanded="false">{{ $Category->title() }}</a>
                        <ul class="dropdown-menu mega-mostafa {{$Category->title_en}}">
                            <li>
                                @php
                                    $count = $Category->children()->whereHas('Devices')->count();
                                    $width = 'auto';
                                    if($count == 1){
                                        $width = '250px';
                                    }elseif($count == 2){
                                        $width = '500px';
                                    }
                                @endphp
                                <div class="row mb-3" style="width: {{ $width }}">
                                    @foreach($Category->children as $SubCategory)
                                        @if($SubCategory->Devices->count())
                                            <div class="@if($count == 1) col-12 @elseif($count == 2) col-md-6 @else col-md-6 col-lg-4 @endif">
                                                <b>{{ $SubCategory->title() }}</b>
                                                <ul>
                                                    @foreach($SubCategory->Devices as $Device)
                                                        <li style="width: 100%;">
                                                            <a style="overflow: hidden;font-size: 13px;" href="{{ route('Client.device',$Device) }}">- {{ mb_strimwidth($Device->title(), 0, 30, '...') }}</a>
                                                        </li>
                                                    @endforeach
                                                </ul>
                                            </div>
                                        @endif
                                    @endforeach
                                </div>
                            </li>
                        </ul>
                    </li>
                @endforeach



                 <li>
                    <a class="main-category-title  dropdown-toggle"  data-bs-toggle="dropdown" aria-expanded="false">@lang('trans.brands')</a>
                    <ul class="dropdown-menu mega-mostafa brand">
                        <li>
                            <div class="row mb-3" style="width: {{ $width }}">
                                @foreach(Brands() as $Brand)
                                    <div class="col-md-6 col-lg-4">
                                        <a class="dropdown-item w-100" href="{{ route('Client.categories',['brand_id'=>$Brand->id]) }}">
                                            <img class="m-0" src="{{ asset($Brand->file) }}" width="30" >
                                            <b class="mx-2">
                                                {{ $Brand->title() }}
                                            </b>
                                        </a>
                                    </div>
                                @endforeach
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>

    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const navItems = document.querySelectorAll('#mega_menu ul li a.dropdown-toggle');

        navItems.forEach(item => {
            item.addEventListener('click', function (event) {
                event.preventDefault(); // Prevent the default action
                const dropdownMenu = item.nextElementSibling;
                const isVisible = dropdownMenu.style.display === 'block';

                // Hide all dropdowns
                document.querySelectorAll('.mega-mostafa').forEach(menu => menu.style.display = 'none');

                if (!isVisible) {
                    const rect = item.getBoundingClientRect();
                    dropdownMenu.style.left = `${rect.left + window.scrollX}px`;
                    dropdownMenu.style.top = `${rect.bottom + window.scrollY}px`;
                    dropdownMenu.style.display = 'block';
                }
            });
        });

        // Hide dropdowns when clicking outside
        document.addEventListener('click', function (event) {
            const isClickInside = Array.from(navItems).some(item => item.contains(event.target));
            if (!isClickInside) {
                document.querySelectorAll('.mega-mostafa').forEach(menu => menu.style.display = 'none');
            }
        });
    });
</script>
