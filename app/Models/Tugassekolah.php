<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tugassekolah extends Model
{
    use HasFactory;

    protected $fillable = [
        'pelajaran_id',
        'tgl',
        'deskripsi',
        'tgl_pengumpulan',
        'isi_tugas',
        'siswa_id',
        'guru_id',
    ];
}
