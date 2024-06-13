<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;
use Mpdf\Mpdf;

class OrderSummary extends Mailable
{
    use Queueable, SerializesModels;

    public $Order;
    public $pdfPath;

    public function __construct($order,$pdfPath)
    {
        $this->pdfPath = $pdfPath;
        $this->Order = $order;
    }

    public function build()
    {
        return $this->from('info@electros.online', 'Electro Online')->view('emails.order_summary')
            ->attach($this->pdfPath, [
                'as' => 'order_summary.pdf',
                'mime' => 'application/pdf',
            ])
            ->subject('Order Summary');
    }

}