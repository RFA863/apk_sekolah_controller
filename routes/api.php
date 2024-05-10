<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

Route::prefix('sekolah')->group(function () {

    Route::apiResource('siswa', App\Http\Controllers\Api\SiswaController::class);

    Route::apiResource('kelas', App\Http\Controllers\Api\KelasController::class);

    Route::apiResource('absen', App\Http\Controllers\Api\AbsenController::class);

    Route::apiResource('note', App\Http\Controllers\Api\NoteController::class);

    Route::apiResource('guru', App\Http\Controllers\Api\GuruController::class);

    Route::apiResource('konsultasi_bk', App\Http\Controllers\Api\KonsultasiBkController::class);

    Route::apiResource('matpel', App\Http\Controllers\Api\MatpelController::class);

    Route::apiResource('tugas_sekolah', App\Http\Controllers\Api\TugasSekolahController::class);

    Route::apiResource('kalender_event', App\Http\Controllers\Api\KalenderEventController::class);

    Route::apiResource('tabungan', App\Http\Controllers\Api\TabunganController::class);
});
