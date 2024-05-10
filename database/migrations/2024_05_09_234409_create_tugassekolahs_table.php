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
        Schema::create('tugassekolahs', function (Blueprint $table) {
            $table->id();
            $table->date('tgl');
            $table->date('tgl_pengumpulan');
            $table->string('deskripsi', 150);
            $table->text('isi_tugas');
            $table->integer('matpel_id');
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
        Schema::dropIfExists('tugassekolahs');
    }
};
