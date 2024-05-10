<?php

namespace App\Http\Controllers\Api;

use App\Models\Konsultasi_bk;
use App\Http\Controllers\Controller;
use App\Http\Resources\DefaultResource;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class KonsultasiBkController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $getData = Konsultasi_bk::with('siswa', 'guru')->when(request()->q, function ($query) {
            $query->where('tujuan', 'like', '%' . request()->q . '%');
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
            'tujuan' => 'required',
            'tanggal' => 'required',
            'status' => 'required',
            'tempat' => 'required',
            'jam' => 'required',
            'siswa_id' => 'required',
            'guru_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $data = Konsultasi_bk::create([
            'tujuan' => $request->tujuan,
            'tanggal' => $request->tanggal,
            'status' => $request->status,
            'tempat' => $request->tempat,
            'jam' => $request->jam,
            'siswa_id' => $request->siswa_id,
            'guru_id' => $request->guru_id,
        ]);

        return response()->json(new DefaultResource(true, 'Success', $data), 200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $getData = Konsultasi_bk::findOrFail($id);

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
        $data = Konsultasi_bk::findOrFail($id);

        if (!$data) {
            return response()->json(new DefaultResource(false, 'Not Found', null), 404);
        }

        $validator = Validator::make(request()->all(), [
            'tujuan' => 'required',
            'tanggal' => 'required',
            'status' => 'required',
            'tempat' => 'required',
            'jam' => 'required',
            'siswa_id' => 'required',
            'guru_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $data->update([
            'tujuan' => $request->tujuan,
            'tanggal' => $request->tanggal,
            'status' => $request->status,
            'tempat' => $request->tempat,
            'jam' => $request->jam,
            'siswa_id' => $request->siswa_id,
            'guru_id' => $request->guru_id,
        ]);

        return response()->json(new DefaultResource(true, 'Success', $data), 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $data = Konsultasi_bk::findOrFail($id);

        if (!$data) {
            return response()->json(new DefaultResource(false, 'Not Found', null), 404);
        }

        $data->delete();

        return response()->json(new DefaultResource(true, 'Success', null), 200);
    }
}
