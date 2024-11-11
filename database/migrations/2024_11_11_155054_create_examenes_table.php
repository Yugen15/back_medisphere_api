<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExamenesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('examenes', function (Blueprint $table) {
            $table->id();
            $table->string('tipo');
            $table->text('resultado')->nullable();
            $table->unsignedBigInteger('id_consulta');
            $table->timestamps();
            $table->softDeletes();

            // Foreign key constraint
            $table->foreign('id_consulta')
                ->references('id')
                ->on('consultas')
                ->onDelete('cascade'); // Optional: Specify cascade on delete if needed
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('examenes');
    }
}
