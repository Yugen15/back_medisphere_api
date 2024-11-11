<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Log;
use App\Models\Medico;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade\Pdf;


class MedicoController extends Controller
{
    public function select()
    {
        try {
            $medicos = Medico::select(
                'medicos.id',
                'medicos.nombre',
                'medicos.apellido',
                'especialidades.name as id_especialidad'
            )
                ->join('especialidades', 'medicos.id_especialidad', '=', 'especialidades.id')
                ->get();
            if ($medicos->count() > 0) {
                return response()->json([
                    'code' => 200,
                    'data' => $medicos

                ], 200);
            } else {
                return response()->json([
                    'code' => 200,
                    'data' => 'No hay especialidades'
                ], 400);
            }
        } catch (\Throwable $th) {
            return response()->json($th->getMessage(), 500);
        }
    }


    public function store(Request $request)
    {
        try {
            // Se valida que todos los campos sean requeridos
            $validacion = Validator::make($request->all(), [
                'nombre' => 'required',
                'apellido' => 'required',
                'id_especialidad' => 'required'
            ]);
            if ($validacion->fails()) {
                // Si no se cumple la validación se devuelve el mensaje de error
                return response()->json([
                    'code' => 400,
                    'data' => $validacion->messages()
                ], 400);
            } else {
                // Si se cumple la validación se inserta el cliente
                $cliente = Medico::create($request->all());
                return response()->json([
                    'code' => 200,
                    'data' => 'Medico insertado'
                ], 200);
            }
        } catch (\Throwable $th) {
            return response()->json($th->getMessage(), 500);
        }
    }
    public function update(Request $request, $id)
    {
        try {
            // Se valida que todos los campos sean requeridos
            $validacion = Validator::make($request->all(), [
                'nombre' => 'required',
                'apellido' => 'required',
                'id_especialidad' => 'required'
            ]);
            if ($validacion->fails()) {
                // Si no se cumple la validación se devuelve el mensaje de error
                return response()->json([
                    'code' => 400,
                    'data' => $validacion->messages()
                ], 400);
            } else {
                // Si se cumple la validación se busca el cliente
                $cliente = Medico::find($id);
                if ($cliente) {
                    // Si el cliente existe se actualiza
                    $cliente->update($request->all());
                    return response()->json([
                        'code' => 200,
                        'data' => 'Médico actualizado'
                    ], 200);
                } else {
                    // Si el cliente no existe se devuelve un mensaje
                    return response()->json([
                        'code' => 404,
                        'data' => 'Médico no encontrado'
                    ], 404);
                }
            }
        } catch (\Throwable $th) {
            return response()->json($th->getMessage(), 500);
        }
    }
    public function delete($id)
    {
        try {
            // Se busca el cliente
            $cliente = Medico::find($id);
            if ($cliente) {
                // Si el cliente existe se elimina
                $cliente->delete($id);
                return response()->json([
                    'code' => 200,
                    'data' => 'Médico eliminado'
                ], 200);
            } else {
                // Si el cliente no existe se devuelve un mensaje
                return response()->json([
                    'code' => 404,
                    'data' => 'Médico no encontrado'
                ], 404);
            }
        } catch (\Throwable $th) {
            return response()->json($th->getMessage(), 500);
        }
    }
    public function find($id)
    {
        try {
            // Se busca el cliente
            $cliente = Medico::find($id);
            if ($cliente) {
                // Si el cliente existe se retornan sus datos
                $datos = Medico::select(
                    'medicos.id',
                    'medicos.nombre',
                    'medicos.apellido',
                    'medicos.id_especialidad',
                    'especialidades.name as especialidad'
                )
                    ->join('especialidades', 'especialidades.id', '=', 'medicos.id_especialidad')
                    ->where('medicos.id', '=', $id)
                    ->get();
                return response()->json([
                    'code' => 200,
                    'data' => $datos[0]
                ], 200);
            } else {
                // Si el cliente no existe se devuelve un mensaje
                return response()->json([
                    'code' => 404,
                    'data' => 'Médico no encontrado'
                ], 404);
            }
        } catch (\Throwable $th) {
            return response()->json($th->getMessage(), 500);
        }
    }

    public function generarPDFConsultas($id_medico)
    {
        Log::info('Iniciando generación de PDF para médico ID: ' . $id_medico);
        
        try {
            // Log de inicio de consulta
            Log::info('Iniciando consulta de datos del médico');
            
            // Consulta para obtener información del médico
            $medico = DB::table('medicos as m')
                ->join('especialidades as e', 'm.id_especialidad', '=', 'e.id')
                ->select('m.nombre', 'm.apellido', 'e.name as especialidad')
                ->where('m.id', '=', $id_medico)
                ->first();

            // Log del resultado de la consulta del médico
            if ($medico) {
                Log::info('Médico encontrado:', [
                    'nombre' => $medico->nombre,
                    'apellido' => $medico->apellido,
                    'especialidad' => $medico->especialidad
                ]);
            } else {
                Log::warning('No se encontró el médico con ID: ' . $id_medico);
                return response()->json([
                    'code' => 404,
                    'message' => 'Médico no encontrado'
                ], 404);
            }

            // Log de inicio de consulta de citas
            Log::info('Iniciando consulta de consultas médicas');
            
            // Consulta de las consultas médicas
            $consultasQuery = DB::table('medicos as m')
                ->join('citas as ci', 'm.id', '=', 'ci.doctor_id')
                ->join('consultas as c', 'ci.id', '=', 'c.id_cita')
                ->join('especialidades as e', 'm.id_especialidad', '=', 'e.id')
                ->join('pacientes as p', 'ci.paciente_id', '=', 'p.id')
                ->select(
                    'm.nombre as nombre_medico',
                    'm.apellido as apellido_medico',
                    'p.nombre as nombre_paciente',
                    'p.apellido as apellido_paciente',
                    'c.fecha as fecha_consulta',
                    'c.diagnostico',
                    'c.estado as estado_consulta'
                )
                ->where('m.id', '=', $id_medico)
                ->whereNull('c.deleted_at');

            // Log de la consulta SQL
            Log::info('Query SQL:', [
                'sql' => $consultasQuery->toSql(),
                'bindings' => $consultasQuery->getBindings()
            ]);

            $consultas = $consultasQuery->get();

            // Log del resultado de la consulta
            Log::info('Consultas encontradas: ' . $consultas->count());

            // Log de inicio de generación de PDF
            Log::info('Iniciando generación del PDF');

            try {
                // Generar el PDF
                $pdf = PDF::loadView('medico.reporte', [
                    'consultas' => $consultas,
                    'medico' => $medico
                ]);

                Log::info('PDF generado exitosamente');

                // Convertir PDF a base64
                $pdfContent = base64_encode($pdf->output());
                
                Log::info('PDF convertido a base64 exitosamente');

                return response()->json([
                    'code' => 200,
                    'pdf' => $pdfContent
                ], 200);

            } catch (\Exception $e) {
                Log::error('Error al generar el PDF: ' . $e->getMessage(), [
                    'exception' => $e
                ]);

                return response()->json([
                    'code' => 500,
                    'message' => 'Error al generar el PDF: ' . $e->getMessage()
                ], 500);
            }

        } catch (\Throwable $th) {
            Log::error('Error general en generarPDFConsultas: ' . $th->getMessage(), [
                'exception' => $th,
                'trace' => $th->getTraceAsString()
            ]);

            return response()->json([
                'code' => 500,
                'message' => $th->getMessage()
            ], 500);
        }
    }
}
