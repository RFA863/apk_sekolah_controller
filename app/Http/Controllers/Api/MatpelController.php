<?php

namespace App\Http\Controllers\Api;

use App\Models\Matpel;
use App\Http\Controllers\Controller;
use App\Http\Resources\DefaultResource;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MatpelController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $getData = Matpel::all();

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
            'pelajaran' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $data = Matpel::create([
            'pelajaran' => $request->pelajaran,
        ]);

        return response()->json(new DefaultResource(true, 'Success', $data), 200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $getData = Matpel::findOrFail($id);

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
        $data = Matpel::findOrFail($id);

        if (!$data) {
            return response()->json(new DefaultResource(false, 'Not Found', null), 404);
        }

        $validator = Validator::make(request()->all(), [
            'pelajaran' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $data->update([
            'pelajaran' => $request->pelajaran,
        ]);

        return response()->json(new DefaultResource(true, 'Success', $data), 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {

        $data = Matpel::findOrFail($id);

        if (!$data) {
            return response()->json(new DefaultResource(false, 'Not Found', null), 404);
        }

        $data->delete();

        return response()->json(new DefaultResource(true, 'Success', null), 200);
    }
}
