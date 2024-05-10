<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Konsultasi_bk extends Model
{
    use HasFactory;

    protected $fillable = [
        'tujuan',
        'tanggal',
        'status',
        'tempat',
        'jam',
        'siswa_id',
        'guru_id',
    ];

    public function siswa()
    {
        return $this->belongsTo(Siswa::class);
    }

    public function guru()
    {
        return $this->belongsTo(Guru::class);
    }
}
