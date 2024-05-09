<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Penerbit extends Model
{
    use HasFactory;

    protected $fillable = [
        'penerbit', 'alamat', 'telp_kantor', 'telp_kontak'
    ];
}
