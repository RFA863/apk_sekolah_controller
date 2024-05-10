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
        Schema::create('absens', function (Blueprint $table) {
            $table->id();
            $table->date('tanggal');
            $table->enum('absensi', ['hadir', 'izin', 'sakit', 'alpha']);
            $table->text('keterangan')->nullable();
            $table->integer('kelas_id');
            $table->integer('siswa_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('absens');
    }
};
