<!-- resources/views/pdfs/reporte.blade.php -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Historial de Consultas por Médico</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .doctor-info {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f5f5f5;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .footer {
            margin-top: 30px;
            text-align: center;
            font-size: 12px;
        }
        .page-break {
            page-break-after: always;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Historial de Consultas Médicas</h1>
    </div>

    <div class="doctor-info">
        <h3>Información del Médico</h3>
        <p><strong>Nombre:</strong> {{ $medico->nombre }} {{ $medico->apellido }}</p>
        <p><strong>Especialidad:</strong> {{ $medico->especialidad }}</p>
        <p><strong>Fecha de generación:</strong> {{ date('d/m/Y H:i:s') }}</p>
    </div>

    @if(count($consultas) > 0)
        <table>
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Paciente</th>
                    <th>Diagnóstico</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                @foreach($consultas as $consulta)
                    <tr>
                        <td>{{ date('d/m/Y', strtotime($consulta->fecha_consulta)) }}</td>
                        <td>{{ $consulta->nombre_paciente }} {{ $consulta->apellido_paciente }}</td>
                        <td>{{ $consulta->diagnostico }}</td>
                        <td>{{ $consulta->estado_consulta }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @else
        <p>No se encontraron consultas registradas para este médico.</p>
    @endif

    <div class="footer">
        <p>Este es un documento generado automáticamente.</p>
    </div>
</body>
</html>