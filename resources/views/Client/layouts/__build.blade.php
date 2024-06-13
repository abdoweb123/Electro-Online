<div class="row">


    @if(!isset($step) || $step == 1)
        <div class="col-12 col-lg-8">
            
            <h1>{{ $Device->title() }}</h1>
                
            <div class="container" style="height: 100px;">
               <section class="step-indicator">
                  <div class="step step1 active">
                     <div class="step-icon">1</div>
                     <p style="width: max-content;">@lang('trans.specifications')</p>
                  </div>
                  <div class="indicator-line active"></div>
                  <div class="step step2">
                     <div class="step-icon">2</div>
                     <p style="width: max-content;">@lang('trans.add-ons')</p>
                  </div>
                  @if($last_step == 3)
                        <div class="indicator-line"></div>
                        <div class="step step3">
                            <div class="step-icon">3</div>
                            <p style="width: max-content;">@lang('trans.accessories')</p>
                        </div>
                  @endif
               </section>
            </div>
            
            
            <h3 class="my-5">{{ __('trans.display') . ' ' . __('trans.size') }}</h3>
            
            <div class="row">
                @foreach($Sizes as $Item)
                    <div class="col-4 col-md-4 col-lg-3 point my-2 position-relative" wire:click="ChangeSelectedSize({{ $Item->size_id }})">
                        @if($SelectedSize ==  $Item->size_id)
                            <i class="fa-regular fa-circle-check text-success position-absolute" style="right: 17px;top: 5px;"></i>
                        @endif
                        <div class="rounded-0 p-3 h5 {{ $SelectedSize ==  $Item->size_id ? 'main_border border-2' : 'border border-dark' }}">
                            <p>{{ $Item->Size->title() }}</p>
                            <p>
                                <small class="mx-1">@lang('trans.from'):</small>
                                <small class="mx-1">{{ $SelectedItem->CalcPriceWithCurrancy() }}</small>
                            </p>
                        </div>
                    </div>
                @endforeach
            </div>
            <h3 class="my-5">{{ __('trans.color') }}</h3>
            <div class="row d-flex">
                @foreach($Colors as $Item)
                    <a style="width: fit-content;" class="point"  wire:click="ChangeSelectedColor({{ $Item->color_id }})">
                        @if($SelectedColor ==  $Item->color_id)
                            <i class="fa-solid fa-circle mx-1 h2 border border-3 p-1 rounded-circle" style="border-style: dashed !important;border-color: {{ $Item->Color->hexa }} !important;color: {{ $Item->Color->hexa }}"></i>
                        @else
                            <i class="fa-solid fa-circle mx-1 h2 p-1 rounded-circle" style="border-color: {{ $Item->Color->hexa }} !important;color: {{ $Item->Color->hexa }}"></i>
                        @endif
                    </a>
                @endforeach
            </div>
            <h3 class="my-5">{{ __('trans.specifications') }}</h3>
            <div class="row">
                @foreach($Specifications as $Item)
                    <div class="col-6 col-md-4 col-lg-3 point my-2 position-relative" wire:click="ChangeSpecification({{ $Item->id }})">
                        @if($SelectedSpecification ==  $Item->id)
                            <i class="fa-regular fa-circle-check text-success position-absolute" style="right: 17px;top: 5px;"></i>
                        @endif
                        <div class="rounded-0 p-3 h5 {{ $SelectedSpecification ==  $Item->id ? 'main_border border-2' : 'border border-dark' }}">
                            <button type="button" class="btn btn-warning my-2">{{ $SelectedItem->CalcPriceWithCurrancy() }}</button>
                            <p>
                                <span>{{ $Item->Size->title() }}</span><br>
                                <span>{{ $Item->Processor->title() }}</span><br>
                                <span>{{ $Item->Memory->title() }}</span><br>
                                <span>{{ $Item->Storage->title() }}</span><br>
                                <span>{{ $Item->OS->title() }}</span><br>
                                <span>{{ $Item->Color->title() }}</span><br>
                            </p>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
        
    @elseif($step == 2)
        <div class="col-12 col-lg-8">
            
            <h1>{{ $Device->title() }}</h1>
                
            <div class="container" style="height: 100px;">
               <section class="step-indicator">
                  <div class="step step1 active" wire:click="change_step(1)" style="cursor: pointer;">
                     <div class="step-icon">1</div>
                     <p style="width: max-content;">@lang('trans.specifications')</p>
                  </div>
                  <div class="indicator-line active"></div>
                  <div class="step step2 active">
                     <div class="step-icon">2</div>
                     <p style="width: max-content;">@lang('trans.add-ons')</p>
                  </div>
                    @if($last_step == 3)
                        <div class="indicator-line active"></div>
                        <div class="step step3">
                            <div class="step-icon">3</div>
                            <p style="width: max-content;">@lang('trans.accessories')</p>
                        </div>
                    @endif
               </section>
            </div>
            
            <div>
                <h1>{{ __('trans.office') }}</h2>
                <img style="max-width: 400px;" class=" img-responsive" style=" mix-blend-mode:multiply;" src="{{ setting('office_image') }}" />
                <div>
                    {!! setting('office_'.lang()) !!}
                </div>
                <div class="row" >
                    @foreach($Office as $OfficeItem)
                        <div class="col-12 col-md-4 point my-2 position-relative" wire:click="SelectOfficeItem({{ $OfficeItem->id }})">
                            @if($SelectedOfficeItem ==  $OfficeItem->id)
                                <i class="fa-regular fa-circle-check text-success position-absolute" style="right: 17px;top: 5px;"></i>
                            @endif
                            <div class="rounded-0 p-3 h5 h-100 {{ $SelectedOfficeItem ==  $OfficeItem->id ? 'main_border border-2' : 'border border-dark' }}" style="font-size: 15px;">
                               <b>
                                   {{ $OfficeItem->title() }}
                               </b> 
                               <p>
                                   {!! $OfficeItem->desc() !!}
                               </p> 
                               <small>
                                   {{ $OfficeItem->CalcPriceWithCurrancy() }}
                               </small>
                            </div>
                        </div>
                    @endforeach
                </div>

            </div>
            <div class="my-5">
                <h1>{{ __('trans.protection') }}</h2>
                <div class="row">
                    <div class="col-md-1">
                        <img style="max-width: 60px;" class=" img-responsive" style=" mix-blend-mode:multiply;" src="{{ setting('protection_image') }}" />
                    </div>
                    <div class="col-md-11">
                        {!! setting('protection_'.lang()) !!}
                    </div>
                    
                    <div class="row" >
                        @foreach($Protection as $ProtectionItem)
                            <div class="col-12 col-md-4 col-lg-3 point my-2 position-relative" wire:click="SelectProtectionItem({{ $ProtectionItem->id }})">
                                @if($SelectedProtectionItem ==  $ProtectionItem->id)
                                    <i class="fa-regular fa-circle-check text-success position-absolute" style="right: 17px;top: 5px;"></i>
                                @endif
                                <div class="rounded-0 p-3 h5 h-100 {{ $SelectedProtectionItem ==  $ProtectionItem->id ? 'main_border border-2' : 'border border-dark' }}" style="font-size: 15px;">
                                   <b>
                                       {{ $ProtectionItem->title() }}
                                   </b> 
                                   <p>
                                       {!! $ProtectionItem->desc() !!}
                                   </p> 
                                   <small>
                                        {{ $ProtectionItem->CalcPriceWithCurrancy() }}
                                   </small>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
            

        </div>
    
    @elseif($step == 3)
            <div class="col-12 col-lg-8">
            
            <h1>{{ $Device->title() }}</h1>
                
            <div class="container" style="height: 100px;">
               <section class="step-indicator">
                  <div class="step step1 active" wire:click="change_step(1)" style="cursor: pointer;">
                     <div class="step-icon">1</div>
                     <p style="width: max-content;">@lang('trans.specifications')</p>
                  </div>
                  <div class="indicator-line active"></div>
                  <div class="step step2 active" wire:click="change_step(2)" style="cursor: pointer;">
                     <div class="step-icon">2</div>
                     <p style="width: max-content;">@lang('trans.add-ons')</p>
                  </div>
                    @if($last_step == 3)
                        <div class="indicator-line active"></div>
                        <div class="step step3 active">
                            <div class="step-icon">3</div>
                            <p style="width: max-content;">@lang('trans.accessories')</p>
                        </div>
                    @endif
               </section>
            </div>
            
            <h5>{{ __('trans.Frequently_bought_together') }}</h5>
            
            <div class="row" id="accessories">
                @foreach ($Device->Accessories as $AccessoryDevice)
                    <div class="col-12 col-md-6  col-lg-4 point my-2 position-relative" wire:click="SelectAccessories({{ $AccessoryDevice->id }})">
                        @if(in_array($AccessoryDevice->id, (array)$SelectedAccessories))
                            <i class="fa-regular fa-circle-check text-success position-absolute" style="right: 17px;top: 5px;"></i>
                        @endif
                        <div class="text-center rounded-0 p-3 h5 h-100 {{ in_array($AccessoryDevice->id, (array)$SelectedAccessories) ? 'main_border border-2' : 'border border-dark' }}" style="font-size: 15px;">
                            <img style="height: 150px;max-width: 100%;" src="{{ asset($AccessoryDevice->Gallery->first()->image) }}">
                            <h6 class="text-center">
                               {{ $AccessoryDevice->title() }}
                            </h6>
                            <p class="text-center">
                                {{ $AccessoryDevice->CalcPriceWithCurrancy() }}
                            </p>
                        </div>
                    </div>
                @endforeach
            </div>
            

        </div>
    @endif
    
    
    @php($sub_total = 0)
    <div class="col-12 col-lg-4 d-flex align-items-center">
        <div class="p-4" style="background-color: #ededed;">
            <div>
                <img class="w-100 img-responsive" style=" mix-blend-mode:multiply;" src="{{ asset($Device->Gallery->when($SelectedColor, fn($query) =>  $query->where('color_id', $SelectedColor) )->first()?->image) }}" />
            </div>
            <h2>@lang('trans.Summary')</h2>
            
                    
            @php($sub_total += ($SelectedItem->CalcPrice()))


            <div class="d-flex justify-content-between align-items-center">
                <p class="my-0">{{ $Device->title() }}</p>
                <p class="my-0" style="min-width: 85px;">{{ $SelectedItem->CalcPriceWithCurrancy() }}</p>
            </div>
            
            <ul>
                <li class="my-0">{{ $SelectedItem?->Size->title() }} @lang('trans.size')</li>
                <li class="my-0">{{ $SelectedItem?->Processor->title() }} @lang('trans.processor')</li>
                <li class="my-0">{{ $SelectedItem?->Memory->title() }} @lang('trans.memory')</li>
                <li class="my-0">{{ $SelectedItem?->Storage->title() }} @lang('trans.storage')</li>
                <li class="my-0">{{ $SelectedItem?->OS->title() }} @lang('trans.os')</li>
            </ul>
            
            @if($SelectedOfficeItem)
                @foreach($Office->where('id',$SelectedOfficeItem) as $OfficeItem)
                    @if($OfficeItem->price > 0)
                        @php($sub_total += ($OfficeItem->CalcPrice()))
                        <div class="d-flex justify-content-between align-items-center">
                            <p>{{ $OfficeItem->title() }}</p>
                            <p class="mx-2" style="min-width: 85px;">{{ $OfficeItem->CalcPriceWithCurrancy() }}</p>
                        </div>
                    @endif
                @endforeach
            @endif
            
            @if($SelectedProtectionItem)
                @foreach($Protection->where('id',$SelectedProtectionItem) as $ProtectionItem)
                    @if($ProtectionItem->price > 0)
                        @php($sub_total += ($ProtectionItem->CalcPrice()))
                        <div class="d-flex justify-content-between align-items-center">
                            <p>{{ $ProtectionItem->title() }}</p>
                            <p class="mx-2" style="min-width: 85px;">{{ $ProtectionItem->CalcPriceWithCurrancy() }}</p>
                        </div>
                    @endif
                @endforeach
            @endif
            
            @if(count($SelectedAccessories))
                @foreach($Device->Accessories->whereIn('id',(array)$SelectedAccessories) as $Accessory)
                    @php($sub_total += ($Accessory->CalcPrice()))
                    <div class="d-flex justify-content-between align-items-center">
                        <p>{{ $Accessory->title() }}</p>
                        <p class="mx-2" style="min-width: 85px;">{{ $Accessory->CalcPriceWithCurrancy() }}</p>
                    </div>
                @endforeach
            @endif
            

            <div class="d-flex justify-content-between align-items-center">
                <p>{{ __('trans.sub_total') }}</p>
                <p class="mx-2" style="min-width: 85px;">{{ format_number($sub_total) . ' ' . Country()->currancy_code }}</p>
            </div>

            @php($vat_percentage = setting('vat'))
            @php($vat = $sub_total /100 * $vat_percentage)
            <div class="d-flex justify-content-between align-items-center">
                <p>{{ __('trans.vat') }} ({{ setting('vat') }}%)</p>
                <p class="mx-2" style="min-width: 85px;">{{ format_number($vat) . ' ' . Country()->currancy_code }}</p>
            </div>
            
            <div class="d-flex justify-content-between align-items-center">
                <p>{{ __('trans.net_total') }}</p>
                <p class="mx-2" style="min-width: 85px;">{{ format_number($sub_total + $vat) . ' ' . Country()->currancy_code }}</p>
            </div>

            <p>@lang('trans.return-days')</p>
            @if($step == $last_step)
                <button class="add-to-cart-button w-100" wire:click="AddToCart()">
                    <svg class="add-to-cart-box box-1" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect width="24" height="24" rx="2" fill="#ffffff" />
                    </svg>
                    <svg class="add-to-cart-box box-2" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect width="24" height="24" rx="2" fill="#ffffff" />
                    </svg>
                    <svg class="cart-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                        viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round"
                        stroke-linejoin="round">
                        <circle cx="9" cy="21" r="1"></circle>
                        <circle cx="20" cy="21" r="1"></circle>
                        <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                    </svg>
                    <svg class="tick" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                        viewBox="0 0 24 24">
                        <path fill="none" d="M0 0h24v24H0V0z" />
                        <path fill="#ffffff"
                            d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zM9.29 16.29L5.7 12.7c-.39-.39-.39-1.02 0-1.41.39-.39 1.02-.39 1.41 0L10 14.17l6.88-6.88c.39-.39 1.02-.39 1.41 0 .39.39.39 1.02 0 1.41l-7.59 7.59c-.38.39-1.02.39-1.41 0z" />
                    </svg>
                    <span class="add-to-cart">@lang('trans.addToCart')</span>
                    <span class="added-to-cart">@lang('trans.addedSuccessfully')</span>
                </button>
            @else
                <button class="btn main_btn px-5 w-100" wire:click="next()">
                    @lang('trans.next')
                </button>
            
            @endif
            <a download class="btn third_btn w-100 mt-3" href="{{ route('Client.report',[
                    'device_id' => $Device->id,
                    'size_id' => $SelectedSize,
                    'color_id' => $SelectedColor,
                    'specification_id' => $SelectedSpecification,
                    'office_id' => $SelectedOfficeItem,
                    'protection_id' => $SelectedProtectionItem,
                    'accessories' => $SelectedAccessories,
                ]) }}">
                <span class="report">@lang('trans.Quotation')</span>
            </a>
        </div>
    </div>
        <script>
    
            addToCartButton = document.querySelectorAll(".add-to-cart-button");
            document.querySelectorAll('.add-to-cart-button').forEach(function(addToCartButton) {
                addToCartButton.addEventListener('click', function() {
                    addToCartButton.classList.add('added');
                    setTimeout(function() {
                        addToCartButton.classList.remove('added');
                    }, 2000);
                    toast(data.type,data.message)
                });
            });
        </script>
</div>

