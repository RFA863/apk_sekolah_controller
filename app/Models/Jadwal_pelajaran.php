<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jadwal_pelajaran extends Model
{
    use HasFactory;

    protected $fillable = [
        'kelasjurusan_ta_id', 'hari', 'pelajaran_id', 'guru_id', 'keterangan'
    ];
}
