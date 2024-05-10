<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tugassekolah extends Model
{
    use HasFactory;

    protected $fillable = [
        'tgl',
        'deskripsi',
        'tgl_pengumpulan',
        'isi_tugas',
        'siswa_id',
        'guru_id',
        'matpel_id',
    ];

    public function siswa()
    {
        return $this->belongsTo(Siswa::class);
    }

    public function guru()
    {
        return $this->belongsTo(Guru::class);
    }

    public function matpel()
    {
        return $this->belongsTo(Matpel::class);
    }
}
