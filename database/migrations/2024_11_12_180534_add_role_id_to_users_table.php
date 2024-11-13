<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddRoleIdToUsersTable extends Migration
{
    public function up()
    {
        // Agregar la columna 'role_id'
        Schema::table('users', function (Blueprint $table) {
            $table->foreignId('role_id')
                ->constrained('roles')
                ->onDelete('cascade');
        });
    }

    public function down()
    {
        // Eliminar la columna 'role_id'
        Schema::table('users', function (Blueprint $table) {
            $table->dropForeign(['role_id']);
            $table->dropColumn('role_id');
        });
    }
}
