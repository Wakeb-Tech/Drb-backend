<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventFilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_files', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('file');
            $table->enum('type',['image','video'])->default('image');
            $table->unsignedBigInteger('event_id');
            $table->foreign('event_id')->references('id')
                ->on('events')->onDelete('cascade');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('event_files');
    }
}
