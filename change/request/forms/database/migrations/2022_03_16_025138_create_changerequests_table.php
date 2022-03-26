<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChangerequestsTable extends Migration
{
    /**
     * Run the migrations.
     *            $table->integer('_id')->nullable();

     * @return void
     */
    public function up()
    {
        Schema::create('changerequests', function (Blueprint $table) {
            $table->id();
            $table->string('request_type');
            $table->string('request_desc', 100);
            $table->string('priority');
            $table->date('deadline')->nullable();
            $table->string('reason', 100)->nullable();
            $table->string('inst_approval')->nullable();
            $table->string('inst_comment')->nullable();
            $table->string('mnrt_approval')->nullable();
            $table->string('mnrt_comment')->nullable();
            $table->string('condition')->nullable();
            //referencing column institution, user, mnrtsystems
            $table->string('created_by', 100)->nullable();
            $table->integer('institution_id')->nullable();
            $table->integer('mnrtsystem_id')->nullable();
            //end of references
            $table->string('updated_by', 50)->nullable();
            $table->string('deleted_by', 50)->nullable();
	        $table->boolean('status')->default('0')->nullable();
            $table->timestamps();
            $table->timestamp('deleted_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('changerequests');
    }
}
