<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kelasjurusan_ta extends Model
{
    use HasFactory;

    protected $fillable = [
        'judul',
        'tanggal',
        'isi',
        'siswakelas_id',
    ];
}
