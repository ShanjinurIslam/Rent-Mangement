<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePaymentDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payment_details', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('invoice_id')->unsigned()->default(12);
            $table->string('payment_type', 100)->default('text');
            $table->string('bank_name', 100)->nullable()->default('text');
            $table->integer('check_number')->unsigned()->nullable()->default(12);
            $table->float('paid_amount')->default(123.45);
            $table->float('due_amount')->nullable()->default(123.45);
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
        Schema::dropIfExists('payment_details');
    }
}
