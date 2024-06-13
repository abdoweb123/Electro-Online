<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Quotation</title>
    <style>
        th {
            text-align: initial;
        }
    </style>
</head>
<body>
<table style="width: 100%;margin-bottom: 50px;">
    <tbody>
    <tr>
        <td>
            <img src="{{ asset(setting('logo')) }}" alt="logo" style="max-width: 200px;">
        </td>
    </tr>
    </tbody>
</table>
<table style="width: 100%;margin-bottom: 50px;">
    <thead>
    <tr>
        <th>Image</th>
        <th>Summary</th>
        <th>Price</th>
    </tr>
    </thead>
    <tbody>
    @php($sub_total = 0)
    @php($Discount = 0)
    @php($Coupon = 0)
    @php($vat_percentage = setting('vat'))

    @foreach ($Cart as $CartItem)
{{--        @php($SelectedItem = $CartItem->Device->Items->when($CartItem->item_id, function ($query) use($CartItem) {--}}
{{--            return $query->where('id', $CartItem->item_id);--}}
{{--        })->first() ?? $CartItem->Device)--}}
        @php($SelectedItem = $CartItem->item_id ? $CartItem->Device->Items->when($CartItem->item_id, function ($query) use ($CartItem) { return $query->where('id', $CartItem->item_id); })->first() ?? $CartItem->Device : $CartItem->Device)
        @php($Device = $CartItem->Device)
        @php($CalcPrice = $SelectedItem->CalcPrice())
        @php($Price = $SelectedItem->Price())

        @php($sub_total += ($CalcPrice * $CartItem->quantity))
        @php($Discount += ($Price -  $CalcPrice))

        <tr>
            <td>
                @php($Image = $Device->Gallery->when($CartItem->color_id, fn($query) =>  $query->where('color_id', $CartItem->color_id) )->first() )
                <div style="text-align: center;">
                    <img  src="{{ asset($Image->image) }}" style="max-height:100px;max-width:100px;margin:10px" />
                </div>
            </td>
            <td>
                <p>
                    {{ $Device->title_en }}
                </p>
                <br>
                @if($SelectedItem->size_id)
                    <p>
                        <b>Size:</b>
                        {{ $SelectedItem->size_id ? $SelectedItem->Size->title_en : '' }}
                    </p>
                @endif
                @if($SelectedItem->processor_id)
                    <p>
                        <b>Processor:</b>
                        {{ $SelectedItem->processor_id ? $SelectedItem->Processor->title_en : '' }}
                    </p>
                @endif
                @if($SelectedItem->memory_id)
                    <p>
                        <b>Memory:</b>
                        {{ $SelectedItem->memory_id ? $SelectedItem->Memory->title_en : '' }}
                    </p>
                @endif
                @if($SelectedItem->storage_id)
                    <p>
                        <b>Storage:</b>
                        {{ $SelectedItem->storage_id ? $SelectedItem->Storage->title_en : '' }}
                    </p>
                @endif
                @if($SelectedItem->os)
                    <p>
                        <b>OS:</b>
                        {{ $SelectedItem->os ? $SelectedItem->OS->title_en : '' }}
                    </p>
                @endif
            </td>
            <td>
                <p>{{ $CartItem->quantity }} * {{ $SelectedItem->CalcPrice() }} {{ country()->currancy_code_en }}</p>
            </td>
        </tr>


        @forelse($CartItem->typeItem as $item)
            @php($sub_total += ($item->CalcPrice() * $CartItem->quantity))
            <tr>
                <td>
                    <div style="text-align: center;">
                        <img  src="{{ asset($item->type->file) }}" style="max-height:100px;max-width:100px;margin:10px" />
                    </div>
                </td>
                <td>
                    <p>
                        {{ $item->title_en }}
                    </p>
                </td>
                <td>
                    <p>{{ $CartItem->quantity }} * {{ $item->CalcPriceWithCurrancy() }}</p>
                </td>
            </tr>
        @empty
        @endforelse

    @endforeach
    </tbody>
</table>
@php($vat = $sub_total /100 * $vat_percentage)
<table style="width: 100%;margin-bottom: 50px;">
    <tbody>
    <tr>
        <td style="width:50%">
            <b>Sub Total:</b>
        </td>
        <td style="width:50%;text-align: right;">
            <p>{{ format_number($sub_total) }} {{ country()->currancy_code_en }}</p>
        </td>
    </tr>
    <tr>
        <td style="width:50%">
            <b>Discount:</b>
        </td>
        <td style="width:50%;text-align: right;">
            <p>{{ format_number($Discount) }} {{ country()->currancy_code_en }}</p>
        </td>
    </tr>
    <tr>
        <td style="width:50%">
            <b>Coupon:</b>
        </td>
        <td style="width:50%;text-align: right;">
            <p>{{ format_number($Coupon) }} {{ country()->currancy_code_en }}</p>
        </td>
    </tr>
    <tr>
        <td style="width:50%">
            <b>VAT ({{ $vat_percentage }}%):</b>
        </td>
        <td style="width:50%;text-align: right;">
            <p>{{ format_number($vat) }} {{ country()->currancy_code_en }}</p>
        </td>
    </tr>
    <tr>
        <td style="width:50%">
            <b>Net Total:</b>
        </td>
        <td style="width:50%;text-align: right;">
            <p>{{ format_number($sub_total + $vat) }} {{ country()->currancy_code_en }}</p>
        </td>
    </tr>
    </tbody>
</table>



<p>@lang('trans.return-days',[],'en')</p>

</body>
</html>