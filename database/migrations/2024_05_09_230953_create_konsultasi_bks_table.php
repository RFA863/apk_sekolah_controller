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
        Schema::create('konsultasi_bks', function (Blueprint $table) {
            $table->id();
            $table->string('tujuan', 100);
            $table->date('tanggal');
            $table->string('status', 100);
            $table->string('tempat', 100);
            $table->time('jam');
            $table->integer('siswa_id');
            $table->integer('guru_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('konsultasi_bks');
    }
};
