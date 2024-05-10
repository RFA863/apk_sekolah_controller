<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Matpel extends Model
{
    use HasFactory;

    protected $fillable = [
        'pelajaran'
    ];

    public function tugassekolah()
    {
        return $this->hasMany(Tugassekolah::class);
    }
}
