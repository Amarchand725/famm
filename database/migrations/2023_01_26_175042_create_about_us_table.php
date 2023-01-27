<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('about_us', function (Blueprint $table) {
            $table->id();
            $table->string('currency');
            $table->string('currency_symbol');
            $table->string('fast_delivery');
            $table->string('free_shipping');
            $table->string('best_quality');
            $table->string('banner');
            $table->string('banner_title');
            $table->string('banner_content');
            $table->string('subscriber_content');
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
        Schema::dropIfExists('about_us');
    }
};
