<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Summary Email</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <meta content="telephone=no" name="format-detection">
    <meta content=
          "width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=no;"
          name="viewport">
    <style>
        .main-table td, .main-table th {
            text-align: center;
            padding: 5px;
            border-top: 1px solid #333;
            margin: 0 -1px;
        }

        .main-table tr {
            border: 1px solid #333;
        }
    </style>
</head>
<body style="margin:0; padding:10px 0 0 0;" bgcolor="#FFFFFF">
<table align="center" cellpadding="0" cellspacing="0" width="95%%" style="padding:15px;">
    <tr>
        <td align="center">
            <table align="center" border="1" cellpadding="0" cellspacing="0" width="600px" style="margin:15px;padding:15px;" bgcolor="#FFFFFF">
                <tr>
                    <td align="center" style="padding:5px;">
                        <a href="https://electros.online" target="_blank">
                            <img src="{{ asset(setting('logo')) }}" alt="Logo" style="width:186px;border:0;"/>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#ffffff" style="padding:30px 0;">
                        <table class="main-table">
                            <tr>
                                <th colspan="9" style="text-align: left;">
                                    <span style="float: left;padding: 10px;">Order No. {{ $Order['id'] }}</span>
                                    <span style="float: right;padding: 10px;">{{ date('F j, Y', strtotime($Order->created_at)) }}</span>
                                </th>
                            </tr>

                            <tr>
                                <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="1">Product</th>
                                 @foreach($Order->Devices as $Device )
                                <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="5">{{ strip_tags($Device->title()) }}</td>
                             @endforeach
                            </tr>
                            <tr>
                                <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="1">Quantity</th>
                                 @foreach($Order->Devices as $Device )
                                <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="5">{{ $Device->quantity }}</td>
                             @endforeach
                            </tr>
                            <tr>
                                <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="1">Price</th>
                                 @foreach($Order->Devices as $Device )
                                <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="5">{{ $Device->CalcPriceWithCurrancy() }}</td>
                            @endforeach
                            </tr>
                            <tr>
                                <th colspan="9">Order Info</th>
                            </tr>
                            <tr>
                                <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="1">Payment Method</th>
                                <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ $Order->Payment->title_en }}</td>
                            </tr>
                            <tr>
                                <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="1">Sub Total</th>
                                <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ number_format(floatval($Order->sub_total * Country()->currancy_value), 3 , '.', '') }} {{ Country()->currancy_code }}</td>
                            </tr>
                                @if($Order->discount > 0 || $Order->coupon_val > 0)
                                <tr>
                                    <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="1">Discount</th>
                                    <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ number_format(floatval(($Order->discount + $Order->coupon_val) * Country()->currancy_value), 3 , '.', '') }} {{ Country()->currancy_code }}</td>
                                </tr>
                                @endif
                            <tr>
                                <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="1">VAT</th>
                                <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ number_format(floatval($Order->vat * Country()->currancy_value), 3 , '.', '') }} {{ Country()->currancy_code }}</td>
                            </tr>
                            <tr>
                                <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="1">Delivery Charge</th>
                                <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ number_format(floatval(($Order->Address->Region->delivery_cost) * Country()->currancy_value), 3 , '.', '') }} {{ Country()->currancy_code }}</td>
                            </tr>
                            <tr>
                                <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="1">Net Total</th>
                                <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ number_format(floatval(($Order->net_total) * Country()->currancy_value), 3 , '.', '') }} {{ Country()->currancy_code }}</td>
                            </tr>

{{--                            @foreach($Order->Devices as $Device )--}}
{{--                                <tr>--}}
{{--                                    <td colspan="2">{{ $Device->quantity }}</td>--}}
{{--                                    <td colspan="4">{{ number_format($Device->price,3) }} BHD</td>--}}
{{--                                </tr>--}}
{{--                            @endforeach--}}

                            @if($Order->Address)
                                <tr>
                                    <th colspan="9">Client Info</th>
                                </tr>
                                <tr>
                                    <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="4">Name</th>
                                    <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ $Order->Client->name }}</td>
                                </tr>
                                <tr>
                                    <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="4">Phone :</th>
                                    <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ $Order->Client->phone_code . ' ' .  $Order->Client->phone }}</td>
                                </tr>
                                <tr>
                                    <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="4">Phone</th>
                                    <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ $Order->Client->phone_code . ' ' .  $Order->Client->phone }}</td>
                                </tr>
                                <tr>
                                    <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="4">Region</th>
                                    <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ $Order->Address->Region->title_en }}</td>
                                </tr>
                                <tr>
                                    <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="4">Block</th>
                                    <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ $Order->Address->block }}</td>
                                </tr>
                                <tr>
                                    <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="4">Road</th>
                                    <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ $Order->Address->road }}</td>
                                </tr>
                                <tr>
                                    <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="4">Building</th>
                                    <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ $Order->Address->building }}</td>
                                </tr>
                                <tr>
                                    <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="4">Additional Directions</th>
                                    <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ $Order->Address->additional_directions }}</td>
                               </tr>
                            @else
                                <tr>
                                    <th colspan="9">Client Info</th>
                                </tr>
                                <tr>
                                    <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="4">Name</th>
                                    <th style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">Phone</th>
                                </tr>
                                <tr>
                                    <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" scope="col" colspan="4">{{ $Order->Client->name }}</td>
                                    <td style="padding: 0.5rem 0.5rem;border: #CCC 1px solid !important" colspan="8">{{ $Order->Client->phone_code . ' ' .  $Order->Client->phone }}</td>
                                </tr>
                            @endif



                        </table>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF">
                        <table cellpadding="0" cellspacing="0" width="100%" style="padding:10px;">
                            <tr>
                                <td width="260" valign="top" style="padding: 0 0 15px 0;">
                                    <table cellpadding="0" cellspacing="0" width="100%%">
                                        <tr>
                                            <td align="center">
                                                <a href="tel:97333355900" target="_blank">
                                                    <img src="https://life-pulse.net/mail/phone-icon.jpeg" alt="اتصل بنا" style="display: block;max-width: 130px;"/>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="font-family: tahoma; font-weight:bold; color:#707070;font-size: 13px;padding: 10px 0 0 0;">
                                                <a href="tel:97333355900" target="_blank">
                                                    <p>@lang('trans.Call Us')</p>
                                                    <p>{{setting('phone')??'97333355900'}}</p>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="font-size: 0; line-height: 0;" width="20">
                                    &nbsp;
                                </td>
                                <td width="260" valign="top">
                                    <table cellpadding="0" cellspacing="0" width="100%%" >
                                        <tr>
                                            <td align="center">
                                                <a href="mailto:info@sensesjewel.com	">
                                                    <img src="https://life-pulse.net/mail/email-icon.jpeg" alt="Email us" style="display: block;max-width: 130px;"/>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="font-family: tahoma; font-weight:bold; color:#707070;font-size: 13px;padding: 10px 0 0 0;">
                                                <a href="mailto:info@sensesjewel.com	">
                                                    <p> @lang('trans.contact_us_email')</p>
                                                    <p>{{setting('email')??'info@gmail.com'}}	</p>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="font-size: 0; line-height: 0;" width="20">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF" style="padding: 15px 15px 15px 15px;">
                        <table cellpadding="0" cellspacing="0" width="100%%">
                            <tr>
                                <td align="center">
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <a href="https://www.facebook.com/lifepubh" target="_blank">
                                                    <img src="https://life-pulse.net/mail/facebook-icon.jpeg" alt="Facebook" width="50" height="50" style="display: block;max-width: 130px;"/>
                                                </a>
                                            </td>
                                            <td style="font-size: 0; line-height: 0;" width="20">&nbsp;</td>
                                            <td>
                                                <a href="https://www.instagram.com/Life_pulse_bh/" target="_blank">
                                                    <img src="https://life-pulse.net/mail/instagram-icon.jpeg" alt="Instagram" width="50" height="50"style="display: block;max-width: 130px;"/>
                                                </a>
                                            </td>
                                            <td style="font-size: 0; line-height: 0;" width="20">&nbsp;</td>
                                            <td>
                                                <a href="https://twitter.com/life_pulse_bh" target="_blank">
                                                    <img src="https://life-pulse.net/mail/twitter-icon.jpeg" alt="Twitter" width="50" height="50"style="display: block;max-width: 130px;"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>