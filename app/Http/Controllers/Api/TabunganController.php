<?php

namespace App\Http\Controllers\Api;

use App\Models\Tabungan;
use App\Http\Controllers\Controller;
use App\Http\Resources\DefaultResource;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TabunganController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $getData = Tabungan::with('siswa', 'kelas')->when(request()->q, function ($query) {
            $query->where('jumlah_tabungan', 'like', '%' . request()->q . '%');
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
            'nominal' => 'required',
            'tanggal' => 'required',

            'siswa_id' => 'required',
            'kelas_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }



        $data = Tabungan::create([
            'nominal' => $request->nominal,
            'tanggal' => $request->tanggal,
            'jumlah_tabungan' => $request->nominal,
            'siswa_id' => $request->siswa_id,
            'kelas_id' => $request->kelas_id,
        ]);

        return response()->json(new DefaultResource(true, 'Success', $data), 200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $getData = Tabungan::findOrFail($id);

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
        $data = Tabungan::findOrFail($id);

        if (!$data) {
            return response()->json(new DefaultResource(false, 'Not Found', null), 404);
        }

        $validator = Validator::make(request()->all(), [
            'nominal' => 'required',
            'tanggal' => 'required',
            'jumlah_penarikan' => 'nullable',
            'siswa_id' => 'required',
            'kelas_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $total_tarik = 0;
        $saldo = $data->jumlah_tabungan + $request->nominal;

        if ($request->jumlah_penarikan) {
            $total_tarik = $data->total_penarikan + $request->jumlah_penarikan;
            $saldo = $data->jumlah_tabungan - $request->jumlah_penarikan;
        }

        $data->update([
            'nominal' => $request->nominal,
            'tanggal' => $request->tanggal,
            'jumlah_tabungan' => $saldo,
            'jumlah_penarikan' => $request->jumlah_penarikan,
            'total_penarikan' => $total_tarik,
            'siswa_id' => $request->siswa_id,
            'kelas_id' => $request->kelas_id,
        ]);

        return response()->json(new DefaultResource(true, 'Success', $data), 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $data = Tabungan::findOrFail($id);

        if (!$data) {
            return response()->json(new DefaultResource(false, 'Not Found', null), 404);
        }

        $data->delete();

        return response()->json(new DefaultResource(true, 'Success', null), 200);
    }
}
