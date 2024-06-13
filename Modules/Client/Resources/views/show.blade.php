@extends('Admin.layout')
@section('pagetitle', __('trans.clients'))




@section('content')
    
    @push('css')
        <style>
        
            .chat-online {
                color: #34ce57
            }
            
            .chat-offline {
                color: #e4606d
            }
            
            .chat-messages {
                display: flex;
                flex-direction: column;
                max-height: 500px;
                min-height: 400px;
                overflow-y: scroll
            }
            
            .chat-message-left,
            .chat-message-right {
                display: flex;
                flex-shrink: 0
            }
            
            .chat-message-left {
                margin-right: auto
            }
            
            .chat-message-right {
                flex-direction: row-reverse;
                margin-left: auto
            }
            .py-3 {
                padding-top: 1rem!important;
                padding-bottom: 1rem!important;
            }
            .px-4 {
                padding-right: 1.5rem!important;
                padding-left: 1.5rem!important;
            }
            .flex-grow-0 {
                flex-grow: 0!important;
            }
            .border-top {
                border-top: 1px solid #dee2e6!important;
            }
            
            .no-messages{
                -webkit-user-drag: none;
                -khtml-user-drag: none;
                -moz-user-drag: none;
                -o-user-drag: none;
                user-drag: none;
            }
        </style>
    @endpush
    

    <main class="content">
        <div class="container p-0">
    
    		<h1 class="h3 mb-3">@lang('trans.messages')</h1>
    
    		<div class="card">
    			<div class="row g-0">
    				<div class="col-12"> 
    					<div class="py-2 px-4 border-bottom d-none d-lg-block">
    						<div class="d-flex align-items-center py-1">
    							<div class="position-relative">
    								<img src="{{ asset($Model->image ?? 'avatar.png') }}" class="rounded-circle mr-1" alt="Avatar" width="40" height="40">
    							</div>
    							<div class="flex-grow-1 pl-3">
    								<strong class="mx-2">{{ $Model->name }}</strong>
    							</div>
    							<div>
    								
    							</div>
    						</div>
    					</div>
                        
    					<div class="position-relative">
    					    @if(DB::table('chat')->where('client_id',$Model->id)->orderByDesc('id')->count())
        						<div class="chat-messages p-4" style="direction: ltr;">
                                    @foreach(DB::table('chat')->where('client_id',$Model->id)->get() as $ChatItem)
                                        @php($Admin = $Admins->where('id',$ChatItem->admin_id)->first() )
            							<div class="chat-message-{{ $ChatItem->from == 'client' ? 'left' : 'right' }} pb-4">
            								<div>
            									<img src="{{  $ChatItem->from == 'admin' ? asset('avatar-admin.png') : (asset($Model->image ?? 'avatar.png')) }}" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
            								</div>
            								<div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
            									<div class="font-weight-bold mb-1">@if($ChatItem->from == 'admin') {{ $Admin ? $Admin->name : __('trans.admins') }} @else {{ $Model->name }}  @endif</div>
            									<p>
            									    {{ $ChatItem->message }}
            									</p>
        									    <small style="font-size: 12px;">
            									    {{ Carbon\Carbon::parse($ChatItem->created_at)->format("F j, Y, g:i a") }}
            									</small>
            								</div>
            							</div>
        							@endforeach
        						</div>
        					@else
        						<div class="chat-messages p-4" style="direction: ltr;">
            					    <div class="text-center no-messages">
        								<img src="{{ asset('no-messages.png') }}" class="mr-1 no-messages" alt="Avatar" style="max-width:100%;user-select: none">
            					    </div>
        						</div>
        					@endif
    					</div>
    
    					
    					<div class="flex-grow-0 py-3 px-4 border-top" >
    				        <form method="post" action="{{ route('admin.send-message',$Model->id) }}" style="display:contents">
        					    <div class="input-group">
    					            @csrf
        							<input id="input-message" type="text" name="message" class="form-control" placeholder="@lang('trans.leaveMessage') ...">
        							<button class="main-btn btn-hover w-100 text-center rounded-0" id="send">@lang('trans.send')</button>
        						</div>
    				        </form>
    					</div>
    
    				</div>
    			</div>
    		</div>
    	</div>
    </main>
    
    
    
    
    @push('js')
        <script>
            $(".chat-messages").animate({ scrollTop: $('.chat-messages')[0].scrollHeight });
        </script>
    
        @vite(['resources/js/app.js'])
        <script type="module">
    
    
            window.Echo.private(`message.{{ $Model->id }}`).listen('.chat', (message) => {
                $('.no-messages').remove();
                console.log(message);
                const leftRight = message.from === 'admin' ? 'right' : 'left';
                const img = message.from === 'admin' ? "{{ asset('avatar-admin.png') }}" : message.client_image;
                const name = message.from === 'admin' ? (message.admin_name ?? "@lang('trans.admins')") : "{{ $Model->name }}";
        
                $('.chat-messages').append(`
                    <div class="chat-message-${leftRight} pb-4">
                        <div>
                            <img src="${img}" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
                        </div>
                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                            <div class="font-weight-bold mb-1">${name}</div>
                            <p>
                                ${message.message}
                            </p>
                            <small style="font-size: 12px;">
                                ${message.formated_date}
                            </small>
                        </div>
                    </div>
                `);
        
                $(".chat-messages").animate({ scrollTop: $('.chat-messages')[0].scrollHeight });
            });
    
    
            $(document).on("click", "#send", function (event) {
                const message = $('#input-message').val();
                event.preventDefault();    
                $.ajax({
                    url: "{{ route('admin.send-message', $Model->id) }}",
                    method:"POST",
                    dataType: 'json',
                    data:{
                        _token : "{{ csrf_token() }}",
                        client_id: {{ $Model->id }},
                        admin_id: {{ auth('admin')->id() }},
                        message: message,
                    },
                    success:function(){
                        $(".chat-messages").animate({ scrollTop: $('.chat-messages')[0].scrollHeight });
                    }
                });
                $('#input-message').val('');
            });
    
    
        </script>
    @endpush
    
        


@endsection

