<?php

namespace App\Http\Controllers;

use App\Models\Examen;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ExameneController extends Controller
{
    public function index($consultaId)
    {
        try {
            $examenes = Examen::where('id_consulta', $consultaId)->get();
            return response()->json(['data' => $examenes], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error al obtener los exámenes'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'tipo' => 'required|string|max:255',
                'resultado' => 'nullable|string',
                'id_consulta' => 'required|exists:consultas,id'
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $examen = Examen::create($request->all());
            return response()->json(['data' => $examen, 'message' => 'Examen creado exitosamente'], 201);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error al crear el examen'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $validator = Validator::make($request->all(), [
                'tipo' => 'required|string|max:255',
                'resultado' => 'nullable|string'
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $examen = Examen::findOrFail($id);
            $examen->update($request->all());

            return response()->json(['data' => $examen, 'message' => 'Examen actualizado exitosamente'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error al actualizar el examen'], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $examen = Examen::findOrFail($id);
            $examen->delete();
            return response()->json(['message' => 'Examen eliminado exitosamente'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error al eliminar el examen'], 500);
        }
    }
    public function generateReport($id)
    {
        try {
            $examen = DB::select("
                SELECT 
                    e.id,
                    e.tipo AS tipo_examen,
                    e.resultado AS resultado_examen,
                    e.created_at AS fecha_examen,
                    CONCAT(p.nombre, ' ', p.apellido) AS nombre_paciente,
                    p.dui AS dui_paciente
                FROM examenes e
                JOIN consultas c ON e.id_consulta = c.id
                JOIN citas ci ON c.id_cita = ci.id
                JOIN pacientes p ON ci.paciente_id = p.id
                WHERE e.id = ?
            ", [$id]);

            if (empty($examen)) {
                return response()->json(['error' => 'Examen no encontrado'], 404);
            }

            $pdf = PDF::loadView('examene.reporte', [
                'examen' => $examen[0],
                'fecha_actual' => now()->format('d/m/Y')
            ]);

            return $pdf->download('examen-' . str_replace(' ', '-', $examen[0]->nombre_paciente) . '.pdf');
        } catch (\Exception $e) {
            \Log::error('Error generando reporte de examen: ' . $e->getMessage());
            return response()->json(['error' => 'Error al generar el reporte'], 500);
        }
    }
}
