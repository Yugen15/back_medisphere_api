<!-- resources/views/examenes/reporte.blade.php -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Reporte de Examen Médico</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 2cm;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .logo {
            max-width: 150px;
            margin-bottom: 20px;
        }
        .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .info-section {
            margin-bottom: 20px;
        }
        .info-group {
            margin-bottom: 10px;
        }
        .label {
            font-weight: bold;
            display: inline-block;
            width: 150px;
        }
        .result-section {
            margin-top: 30px;
            border: 1px solid #ccc;
            padding: 15px;
        }
        .footer {
            margin-top: 50px;
            text-align: center;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Reporte de Examen Médico</h1>
        <p>Fecha de emisión: {{ $fecha_actual }}</p>
    </div>

    <div class="info-section">
        <div class="info-group">
            <span class="label">Paciente:</span>
            <span>{{ $examen->nombre_paciente }}</span>
        </div>
        <div class="info-group">
            <span class="label">DUI:</span>
            <span>{{ $examen->dui_paciente }}</span>
        </div>
    
        <div class="info-group">
            <span class="label">Fecha del examen:</span>
            <span>{{ \Carbon\Carbon::parse($examen->fecha_examen)->format('d/m/Y H:i') }}</span>
        </div>
    </div>

    <div class="result-section">
        <h2>Resultados del Examen</h2>
        <div class="info-group">
            <span class="label">Tipo de examen:</span>
            <span>{{ $examen->tipo_examen }}</span>
        </div>
        <div class="info-group">
            <span class="label">Resultado:</span>
            <span>{{ $examen->resultado_examen }}</span>
        </div>
    </div>

    <div class="footer">
        <p>Este es un documento médico confidencial</p>
        <p>Generado el {{ $fecha_actual }}</p>
    </div>
</body>
</html>