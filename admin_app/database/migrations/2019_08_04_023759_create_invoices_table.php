<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInvoicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('rent_issue_id')->unsigned()->default(12);
            $table->foreign('rent_issue_id')->references('id')->on('rent_issues')->onDelete('cascade');
            $table->integer('month')->unsigned()->default(12);
            $table->integer('year')->unsigned()->default(12);
            $table->float('electricity_bill')->default(123.45);
            $table->float('gas_bill')->default(123.45);
            $table->float('water_bill')->default(123.45);
            $table->float('service_charge')->default(123.45);
            $table->float('previous_due')->default(123.45);
            $table->float('total_payable')->default(123.45);
            $table->boolean('payment_status')->default(false);
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
        Schema::dropIfExists('invoices');
    }
}
