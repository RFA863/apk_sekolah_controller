<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Siswa_kelas extends Model
{
    use HasFactory;

    protected $fillable = [
        'kelasjurusan_id',
        'siswa_id',
        'keterangan',
    ];
}
