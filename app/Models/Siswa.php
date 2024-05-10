<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Siswa extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama', 'alamat', 'email', 'telepon'
    ];

    public function absen()
    {
        return $this->hasMany(Absen::class);
    }

    public function note()
    {
        return $this->hasMany(Note::class);
    }

    public function konsultasi_bk()
    {
        return $this->hasMany(Konsultasi_bk::class);
    }

    public function tugassekolah()
    {
        return $this->hasMany(Tugassekolah::class);
    }

    public function tabungan()
    {
        return $this->hasOne(Tabungan::class);
    }
}
