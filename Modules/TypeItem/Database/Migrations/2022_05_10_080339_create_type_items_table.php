<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTypeItemTable extends Migration
{
    public function up()
    {
        Schema::create('type_items', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('type_id');
            $table->string('title_ar');
            $table->string('title_en');

            $table->text('desc_ar')->nullable();
            $table->text('desc_en')->nullable();
            $table->text('image')->nullable();

            $table->boolean('status')->default(1);
            $table->timestamps();

            $table->foreign('type_id')->references('id')
                ->onDelete('cascade')->onUpdate('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('type_items');
    }
}
