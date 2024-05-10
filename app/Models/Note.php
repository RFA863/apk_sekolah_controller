<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Note extends Model
{
    use HasFactory;

    protected $fillable = [
        'judul',
        'tanggal',
        'isi',
        'siswa_id',
    ];

    public function siswa()
    {
        return $this->belongsTo(Siswa::class);
    }
}
