<table class="table table-bordered data-table mt-5" >
    <thead>
    <tr>
        <th>@lang('trans.code')</th>
        <th>@lang('trans.description')</th>
        <th>@lang('trans.amount')</th>
        <th>@lang('trans.time_from')</th>
        <th>@lang('trans.time_to')</th>
        <th>@lang('trans.max_uses')</th>
        <th>@lang('trans.time')</th>
        {{-- <th></th> --}}
    </tr>
    </thead>
    <tbody>
    @foreach (MyCoupons() as $Model)
        <tr>
            <td>
                @if($Model->status == 'active')
                    <i style="color:green" class="mx-2 fa-solid fa-circle"></i>
                @elseif($Model->status == 'inactive')
                    <i style="color:red" class="mx-2 fa-solid fa-circle"></i>
                @elseif($Model->status == 'pending')
                    <i style="color:yellow" class="mx-2 fa-solid fa-circle"></i>
                @endif
                {{ $Model->code }}
            </td>
            <td>{!! $Model->description !!}</td>
            <td>
                {{ $Model->discount_amount }} %
            </td>
            <td>{{ $Model->valid_from }}</td>
            <td>{{ $Model->valid_to }}</td>
            <td>{{ $Model->max_uses }}</td>
            <td>{{ $Model['created_at'] }}</td>
            {{-- <td>
                <form class="formDelete" method="POST" action="{{ route('coupons.destroy', $Model)  }}">
                    @csrf
                    <input name="_method" type="hidden" value="DELETE">
                    <button type="submit" class="btn btn-flat show_confirm" data-toggle="tooltip" title="Delete">
                        <i class="fa-solid fa-eraser"></i>
                    </button>
                </form>
            </td> --}}
        </tr>
    @endforeach
    </tbody>
</table>


@push('js')
    <script>
        const now = new Date();
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0');
        const day = String(now.getDate()).padStart(2, '0');
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        const nowFormatted = `${year}-${month}-${day}T${hours}:${minutes}`;
        $('#valid_from').attr('min', nowFormatted);
        $('#valid_to').attr('min', nowFormatted);

        document.getElementById('amount').step = Math.pow(10, -document.getElementById('country_id').options[document.getElementById('country_id').selectedIndex].getAttribute('data-step'));
        document.getElementById('country_id').addEventListener('change', function() {
            const selectedCurrency = this.options[this.selectedIndex];
            const decimal_step = selectedCurrency.getAttribute('data-step');
            document.getElementById('amount').step = Math.pow(10, -decimal_step);
        });
    </script>
@endpush