<?php

namespace App\Http\Controllers\Api;

use App\Models\Absen;
use App\Http\Controllers\Controller;
use App\Http\Resources\DefaultResource;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AbsenController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $getData = Absen::with('siswa', 'kelas')->when(request()->q, function ($query) {
            $query->where('absensi', 'like', '%' . request()->q . '%');
        })->get();

        if ($getData->isEmpty()) {
            return response()->json(new DefaultResource(false, 'No Content', null), 204);
        }

        return response()->json(new DefaultResource(true, 'Success', $getData), 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make(request()->all(), [
            'tanggal'       => 'required',
            'absensi'       => 'required',
            'keterangan'    => 'nullable',
            'siswa_id'      => 'required',
            'kelas_id'      => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $data = Absen::create([
            'tanggal'       => $request->tanggal,
            'absensi'       => $request->absensi,
            'keterangan'    => $request->keterangan,
            'siswa_id'      => $request->siswa_id,
            'kelas_id'      => $request->kelas_id,
        ]);

        return response()->json(new DefaultResource(true, 'Success', $data), 200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $getData = Absen::with('siswa', 'kelas')->when(request()->q, function ($query) {
            $query->where('absensi', 'like', '%' . request()->q . '%');
        })->findOrFail($id);

        if (!$getData) {
            return response()->json(new DefaultResource(false, 'Not Found', null), 404);
        }

        return response()->json(new DefaultResource(true, 'Success', $getData), 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $data = Absen::findOrFail($id);

        if (!$data) {
            return response()->json(new DefaultResource(false, 'Not Found', null), 404);
        }

        $validator = Validator::make(request()->all(), [
            'tanggal'       => 'required',
            'absensi'       => 'required',
            'keterangan'    => 'nullable',
            'siswa_id'      => 'required',
            'kelas_id'      => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $data->update([
            'tanggal'       => $request->tanggal,
            'absensi'       => $request->absensi,
            'keterangan'    => $request->keterangan,
            'siswa_id'      => $request->siswa_id,
            'kelas_id'      => $request->kelas_id,
        ]);

        return response()->json(new DefaultResource(true, "Success", $data), 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $data = Absen::findOrFail($id);

        if (!$data) {
            return response()->json(new DefaultResource(false, 'Not Found', null), 404);
        }

        $data->delete();

        return response()->json(new DefaultResource(true, 'Success', null), 200);
    }
}
