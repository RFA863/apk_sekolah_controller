<?php

namespace App\Http\Controllers\Api;

use App\Models\Tugassekolah;
use App\Http\Controllers\Controller;
use App\Http\Resources\DefaultResource;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TugasSekolahController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $getData = Tugassekolah::with('siswa', 'guru', 'matpel')->when(request()->q, function ($query) {
            $query->where('isi_tugas', 'like', '%' . request()->q . '%');
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
            'tgl' => 'required',
            'deskripsi' => 'required',
            'tgl_pengumpulan' => 'required',
            'isi_tugas' => 'required',
            'siswa_id' => 'required',
            'guru_id' => 'required',
            'matpel_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $data = Tugassekolah::create([
            'tgl' => $request->tgl,
            'deskripsi' => $request->deskripsi,
            'tgl_pengumpulan' => $request->tgl_pengumpulan,
            'isi_tugas' => $request->isi_tugas,
            'siswa_id' => $request->siswa_id,
            'guru_id' => $request->guru_id,
            'matpel_id' => $request->matpel_id,
        ]);

        return response()->json(new DefaultResource(true, 'Success', $data), 200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $getData = Tugassekolah::findOrFail($id);

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
        $data = Tugassekolah::findOrFail($id);

        if (!$data) {
            return response()->json(new DefaultResource(false, 'Not Found', null), 404);
        }

        $validator = Validator::make(request()->all(), [
            'tgl' => 'required',
            'deskripsi' => 'required',
            'tgl_pengumpulan' => 'required',
            'isi_tugas' => 'required',
            'siswa_id' => 'required',
            'guru_id' => 'required',
            'matpel_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $data->update([
            'tgl' => $request->tgl,
            'deskripsi' => $request->deskripsi,
            'tgl_pengumpulan' => $request->tgl_pengumpulan,
            'isi_tugas' => $request->isi_tugas,
            'siswa_id' => $request->siswa_id,
            'guru_id' => $request->guru_id,
            'matpel_id' => $request->matpel_id,
        ]);

        return response()->json(new DefaultResource(true, 'Success', $data), 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $data = Tugassekolah::findOrFail($id);

        if (!$data) {
            return response()->json(new DefaultResource(false, 'Not Found', null), 404);
        }

        $data->delete();

        return response()->json(new DefaultResource(true, 'Success', null), 200);
    }
}
