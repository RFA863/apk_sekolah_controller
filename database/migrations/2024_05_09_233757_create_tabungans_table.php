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
        Schema::create('tabungans', function (Blueprint $table) {
            $table->id();
            $table->integer('nominal')->nullable();
            $table->date('tanggal');
            $table->integer('jumlah_tabungan');
            $table->integer('jumlah_penarikan')->nullable();
            $table->integer('total_penarikan')->nullable();
            $table->integer('siswa_id');
            $table->integer('kelasjurusan_ta_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tabungans');
    }
};
