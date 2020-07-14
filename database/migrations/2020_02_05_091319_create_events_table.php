<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name_ar');
            $table->string('name_en');
            $table->text('desc_ar');
            $table->text('desc_en');
            $table->dateTime('startAt')->nullable();
            $table->dateTime('endAt')->nullable();
            $table->time('startHour')->nullable();
            $table->time('endHour')->nullable();
            $table->string('lat')->nullable();
            $table->string('lng')->nullable();
            $table->string('address')->nullable();
            $table->string('url')->nullable();
            $table->double('cost', 8, 2)->default('0');
            $table->enum('status',['0','1','2'])->default('0');
            $table->unsignedBigInteger("category_id");
            $table->foreign('category_id')->references('id')
                ->on('event_categories')->onDelete('cascade');
            $table->unsignedBigInteger("place_id");
            $table->foreign('place_id')->references('id')
                ->on('locations');

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
        Schema::dropIfExists('events');
    }
}
