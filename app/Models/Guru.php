<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Guru extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama', 'alamat', 'email', 'telepon'
    ];

    public function konsultasi_bk()
    {
        return $this->hasMany(Konsultasi_bk::class);
    }

    public function tugassekolah()
    {
        return $this->hasMany(Tugassekolah::class);
    }
}
