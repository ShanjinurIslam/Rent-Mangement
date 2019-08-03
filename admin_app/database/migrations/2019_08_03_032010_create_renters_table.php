<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRentersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('renters', function (Blueprint $table) {
            $table->increments('renterid');
            $table->string('name');
            $table->integer('nid')->nullable();
            $table->string('passport')->nullable();
            $table->string('profile_image_link')->nullable();
            $table->string('email')->nullable();
            $table->string('mobile_number');
            $table->string('nationality');
            $table->string('gender');
            $table->text('address_line_1');
            $table->text('address_line_2')->nullable();
            $table->string('city');
            $table->string('country');
            $table->integer('zipcode');
            $table->timestamp('updated_at');
            $table->timestamp('created_at');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('renters');
    }
}
