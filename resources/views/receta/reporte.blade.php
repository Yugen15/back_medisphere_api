<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <title>Receta Médica</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 3cm 2cm 2cm 2cm;
            color: #333;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header h1 {
            color: #1d4ed8;
            font-size: 32px;
            margin: 10px 0 0 0;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .header img {
            width: 80px;
            height: auto;
            margin-bottom: 10px;
            border-radius: 50%;
        }

        .header p {
            font-size: 14px;
            color: #555;
            margin: 2px 0;
        }

        .patient-info {
            margin: 20px 0;
            padding: 20px;
            background: #e0f2fe;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .patient-info p {
            margin: 4px 0;
            font-size: 16px;
            font-weight: 500;
            color: #1e3a8a;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 14px;
            color: #374151;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        th {
            background-color: #1d4ed8;
            color: white;
            padding: 12px;
            text-align: left;
            font-size: 15px;
        }

        td {
            padding: 10px;
            border: 1px solid #d1d5db;
        }

        tr:nth-child(even) {
            background-color: #f9fafb;
        }

        tr:hover {
            background-color: #e0f2fe;
        }

        .footer {
            text-align: center;
            font-size: 12px;
            color: #6b7280;
            margin-top: 40px;
            padding: 10px 0;
            border-top: 1px solid #e5e7eb;
        }

        .footer p {
            margin: 5px 0;
        }

        .signature {
            margin-top: 60px;
            display: flex;
            justify-content: space-around;
            text-align: center;
        }

        .signature div {
            margin: 0 20px;
            padding: 10px;
            text-align: center;
        }

        .signature-line {
            border-top: 1px solid #333;
            width: 220px;
            margin-top: 15px;
            opacity: 0.8;
        }

        .disclaimer {
            font-size: 13px;
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #f3f4f6;
            color: #4b5563;
            border-radius: 8px;
            text-align: center;
            line-height: 1.5;
        }
    </style>
</head>

<body>
    <div class="header">
        <img src="C:\wamp64\www\back_medisphere_api\resources\views\receta\logo.png" alt="Clínica Logo">
        <h1>Medisphere</h1>
        <p>Dirección: Itca Fepade, Santa Tecla - Tel: (555) 123-4567</p>
        <p>Fecha de generación: {{ date('d/m/Y H:i:s') }}</p>
    </div>

    <div class="patient-info">
        <p><strong>Paciente:</strong> {{ $datos[0]->nombre_paciente }} {{ $datos[0]->apellido_paciente }}</p>
    </div>

    <table>
        <thead>
            <tr>
                <th>Fecha de consulta</th>
                <th>Médico</th>
                <th>Medicamento</th>
                <th>Dosis</th>
            </tr>
        </thead>
        <tbody>
            @foreach($datos as $receta)
            <tr>
                <td>{{ \Carbon\Carbon::parse($receta->fecha_consulta)->format('d/m/Y') }}</td>
                <td>Dr. {{ $receta->nombre_medico }} {{ $receta->apellido_medico }}</td>
                <td>{{ $receta->medicamento }}</td>
                <td>{{ $receta->dosis }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <div class="signature">
        <div>
            <p>Sello de la clínica</p>
            <div class="signature-line"></div>
        </div>
        <div>
            <p>Firma del médico</p>
            <div class="signature-line"></div>
        </div>
        <div class="disclaimer">
            <p><strong>Nota importante:</strong> Este documento es confidencial y está destinado exclusivamente para el uso del paciente y el personal médico autorizado. Queda estrictamente prohibida su falsificación o uso indebido. Cualquier intento de alteración o reproducción no autorizada será sancionado conforme a la ley.</p>
        </div>

        <div class="footer">
            <p>&copy; 2024 Medisphere. Todos los derechos reservados.</p>
        </div>
    </div>


</body>

</html>