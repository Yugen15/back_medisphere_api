<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecetasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recetas', function (Blueprint $table) {
            $table->id();
            $table->string('medicamento');
            $table->string('dosis');
            $table->unsignedBigInteger('id_consulta');
            $table->timestamps();

            // Foreign key constraint
            $table->foreign('id_consulta')
                ->references('id')
                ->on('consultas')
                ->onDelete('cascade'); // Elimina en cascada si la consulta es eliminada
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('recetas');
    }
}
