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
        Schema::create('kelasjurusan_tas', function (Blueprint $table) {
            $table->id();
            $table->string('judul', 100);
            $table->date('tanggal');
            $table->text('isi');
            $table->integer('siswakelas_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('kelasjurusan_tas');
    }
};
