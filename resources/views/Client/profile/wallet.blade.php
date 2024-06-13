<div class="container">
   <div class="iphone">
      <div class="header">
         <div class="header-summary">
            <div class="summary-text">
               @lang('trans.My-Balance')
            </div>
            <div class="summary-balance">
               {{ auth('client')->user()->wallet }} {{ Country()->currancy_code }}
            </div>

         </div>
         <div class="user-profile">
            <img src="{{ asset('assets/img/wallet.png') }}" class="user-photo">
         </div>
      </div>
      
   </div>
</div>

<div class="container">
    <form method="post" action="{{ route('Client.payment.tap.wallet.init') }}">
        @csrf
        <div class="row">
            <div class="col-md-6 mx-auto">     
            
                <h2>{{ __('trans.recharge-wallet') }}</h2>
                <label class="font-size-16 mb-0">
                    <b>
                        @lang('trans.paymentMethod')
                    </b>
                </label>
                @foreach (Payments()->whereNotIn('id',[1,6]) as $Payment)

                    <div class="row d-flex align-items-center" style="height: 50px;">
                        <div class="col-1">
                            <input class="form-check-input" type="radio" name="payment_id" id="del-{{ $Payment->id }}" value="{{ $Payment->id }}" @checked($loop->first)>
                        </div>
                        <div class="col-11">
                            <label class="form-check-label" for="del-{{ $Payment->id }}">
                                <img src="{{ asset($Payment->image) }}" alt="payment" style="max-width: 50px;margin: 0px 5px">
                                {{ $Payment->title() }}
                            </label>
                        </div>
                    </div>
              
                @endforeach
                
                <div class="form-group">
                    <label for="first">
                        <b>{{ __('trans.amount') }}</b>
                    </label>
                    <input type="number" min="0" step="0.001" name="amount" class="form-control" placeholder="2.650" required/>
                    <button type="submit" class="btn main_btn w-50 mx-auto my-3">{{ __('trans.send') }}</button>
                </div>
            </div>

        </div>
    </form>
    
    <h1 class="mt-5">
        @lang('trans.Transactions')
    </h1>

    <table id="wallet-table">
        <thead>
            <tr>
                <th>#</th>
                <th>@lang('trans.amount')</th>
                <th>@lang('trans.Result')</th>
                <th>@lang('trans.datetime')</th>
            </tr>
        </thead>
        <tbody>
            @foreach( DB::table('transactions')->where('type','wallet')->orderByDesc('id')->get() as $Transaction )
                <tr>
                	<td>{{ $Transaction->transaction_number }}</td>
                	<td>{{ $Transaction->value }}</td>
                	<td>{{ $Transaction->result }}</td>
                	<td>{{ Carbon\Carbon::parse($Transaction->created_at)->format("F j, Y, g:i a") }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    
</div>

@push('js')

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css">
    <script src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.colVis.min.js"></script>


    <script>
        var table = $('#wallet-table').DataTable({
            oLanguage: {
                sUrl: '{{ DT_Lang() }}'
            },
            lengthMenu: [[25, 50,100, -1], [25, 50,100, "All"]]
            , dom: 'Blfrtip'
            , buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'print',
                    exportOptions: {
                        stripHtml: false,
                        columns: ':visible'
                    }
                },
                'colvis'
            ]
        });
    </script>
@endpush

@push('css')
<style>
    
    

    .iphone {
      margin: 10px;
      overflow: hidden;
      position: relative;
      transform: scale(0.9);
      transform-origin: top center;
    }
    
    .header {
      height: 200px;
      background-color: #44B0A0;
      border-bottom-right-radius: 40px;
        border-bottom-left-radius: 40px;
      display: flex;
      justify-content: space-around;
      align-items: center;
      position: relative;
      z-index: 1;
       overflow: hidden;
    }
    
    .header::before{
      content:"";
      height: 200px;
      width: 200px;
      background-color: #53b5a8;
      border-radius: 50%;
      position:absolute;
      top: -60px;
      left: -100px;
      z-index: 2;
    }
    
    .header::after {
      content:"";
      height: 100px;
      width: 100px;
      background-color: #53b5a8;
      border-radius: 50%;
      position:absolute;
      right: -20px;
      bottom: -30px;
      z-index: 2;
     
    }
    
    .header-summary {
      display: flex;
      flex-direction: column;
        font-family: 'Montserrat', sans-serif;
      color: white;
      z-index: 3;
    }
    
    .summary-text {
      font-size: 1.2rem;
      font-weight: 300;
      margin-bottom: 1.5rem;
    }
    
    .summary-balance {
      font-size: 2rem;
      letter-spacing: 1.5px;
      margin-bottom: 0.8rem;
      
    }
    
    .summary-text-2 {
      font-size: 0.8rem;
      letter-spacing: 1px;
    }
    
    .user-profile {
      margin-top: 4rem;
      height: 110px;
      width: 110px;
      align-self: flex-start;
    }
    
    .user-photo {
      height: 100%;
    }
    
    
</style>
@endpush