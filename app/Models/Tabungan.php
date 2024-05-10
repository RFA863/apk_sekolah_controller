<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tabungan extends Model
{
    use HasFactory;

    protected $fillable = [
        'nominal',
        'tanggal',
        'jumlah_tabungan',
        'jumlah_penarikan',
        'total_penarikan',
        'siswa_id',
        'kelas_id'
    ];

    public function siswa()
    {
        return $this->belongsTo(Siswa::class);
    }

    public function kelas()
    {
        return $this->belongsTo(Kelas::class);
    }
}
