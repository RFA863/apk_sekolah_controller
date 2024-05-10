<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kelas extends Model
{
    use HasFactory;

    protected $fillable = [
        'kelas'
    ];

    public function absen()
    {
        return $this->hasMany(Absen::class);
    }

    public function tabungan()
    {
        return $this->hasMany(Tabungan::class);
    }
}
