<li class="nav-item @if(str_contains(Route::currentRouteName(), 'type')) active @endif">
    <a class="collapsed" href="#0" class="" data-bs-toggle="collapse" data-bs-target="#type" aria-controls="type" aria-expanded="true" aria-label="Toggle navigation">
        <span class="icon text-center">
            <i style="width: 20px;" class="fa-brands fa-windows mx-2"></i>
        </span>
        <span class="text">{{ __('trans.type') }}</span>
    </a>
    <ul id="type" class="dropdown-nav mx-4 collapse" style="">
        <li><a href="{{ route('admin.type.index') }}">{{ __('trans.viewAll') }}</a></li>
        <li><a href="{{ route('admin.type.create') }}">{{ __('trans.add') }}</a></li>
    </ul>
</li>