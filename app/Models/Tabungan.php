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
        'jumlah_penarikan',
        'siswa_id',
        'kelasjurusan_ta_id'
    ];
}
