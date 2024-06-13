<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use Modules\Client\Entities\Model as Client;
use Modules\Admin\Entities\Model as Admin;

class SendMessage implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $client_id;
    public $client_name;
    public $client_image;
    
    public $admin_name;
    
    public $message;
    public $from;
    
    public function __construct($client_id,$message,$from,$admin_id = NULL)
    {
        $Client = Client::select('name')->where('id',$client_id)->first();
        $this->client_id = $client_id;
        $this->client_name = $Client->name;
        $this->client_image = asset($Client->image ?? 'avatar.png');
        $this->admin_name = Admin::select('name')->where('id',$admin_id)->first()?->name;
        $this->message = $message;
        $this->from = $from;
    }

    public function broadcastOn()
    {
        return new PrivateChannel('message.' . $this->client_id);
    }
    
    public function broadcastAs()
    {
        return 'chat';
    }
    
    public function broadcastWith()
    {
        return [
            'client_id' => $this->client_id,
            'client_name' => $this->client_name,
            'client_image' => $this->client_image,
            
            'admin_name' => $this->admin_name,
            
            'message' => $this->message,
            'from' => $this->from,
            'formated_date' => now()->format("F j, Y, g:i a"),
        ];
    }
}
