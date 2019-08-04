<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHousesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('houses', function (Blueprint $table) {
            $table->increments('id');
            $table->string('house_name', 100)->default('text');
            $table->string('address_line_1', 100)->default('text');
            $table->string('address_line_2', 100)->nullable()->default('text');
            $table->string('city', 100)->nullable()->default('text');
            $table->string('country', 100)->nullable()->default('text');
            $table->integer('zipcode')->unsigned()->default(12);
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
        Schema::dropIfExists('houses');
    }
}
