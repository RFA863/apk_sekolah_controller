<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('bacaans', function (Blueprint $table) {
            $table->id();
            $table->string('judul', 150);
            $table->string('terbit', 150);
            $table->string('isbn', 150);
            $table->string('cover', 150);
            $table->string('ringkasan', 150);
            $table->string('link', 150);
            $table->integer('penulis_id');
            $table->integer('penerbit_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bacaans');
    }
};
