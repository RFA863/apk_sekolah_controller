<?php

namespace App\Http\Controllers\Api;

use App\Models\Kalender_event;
use App\Http\Controllers\Controller;
use App\Http\Resources\DefaultResource;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class KalenderEventController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $getData = Kalender_event::all();

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
            'judul' => 'required',
            'tanggal' => 'required',
            'deskripsi' => 'nullable',
            'tempat' => 'required',
            'penanggungjawab' => 'required',
            'kontak' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $data = Kalender_event::create([
            'judul' => $request->judul,
            'tanggal' => $request->tanggal,
            'deskripsi' => $request->deskripsi,
            'tempat' => $request->tempat,
            'penanggungjawab' => $request->penanggungjawab,
            'kontak' => $request->kontak,
        ]);

        return response()->json(new DefaultResource(true, 'Success', $data), 200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $getData = Kalender_event::findOrFail($id);

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
        $data = Kalender_event::findOrFail($id);

        if (!$data) {
            return response()->json(new DefaultResource(false, 'Not Found', null), 404);
        }

        $validator = Validator::make(request()->all(), [
            'judul' => 'required',
            'tanggal' => 'required',
            'deskripsi' => 'nullable',
            'tempat' => 'required',
            'penanggungjawab' => 'required',
            'kontak' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $data->update([
            'judul' => $request->judul,
            'tanggal' => $request->tanggal,
            'deskripsi' => $request->deskripsi,
            'tempat' => $request->tempat,
            'penanggungjawab' => $request->penanggungjawab,
            'kontak' => $request->kontak,
        ]);

        return response()->json(new DefaultResource(true, 'Success', $data), 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $data = Kalender_event::findOrFail($id);

        if (!$data) {
            return response()->json(new DefaultResource(false, 'Not Found', null), 404);
        }

        $data->delete();

        return response()->json(new DefaultResource(true, 'Success', null), 200);
    }
}
