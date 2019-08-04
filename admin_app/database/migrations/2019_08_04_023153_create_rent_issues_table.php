<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRentIssuesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rent_issues', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('renter_id')->unsigned()->default(12);
            $table->foreign('renter_id')->references('id')->on('renters')->onDelete('cascade');
            $table->integer('flat_id')->unsigned()->default(12);
            $table->foreign('flat_id')->references('id')->on('flats')->onDelete('cascade');
            $table->integer('start_month')->unsigned()->default(12);
            $table->integer('start_year')->unsigned()->default(12);
            $table->float('initial_rent')->default(123.45);
            $table->float('increase_per_year')->nullable()->default(123.45);
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
        Schema::dropIfExists('rent_issues');
    }
}
