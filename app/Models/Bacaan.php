<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bacaan extends Model
{
    use HasFactory;

    protected $fillable = [
        'judul',
        'terbit',
        'isbn',
        'cover',
        'ringkasan',
        'link',
        'penulis_id',
        'penerbit_id',
    ];
}
