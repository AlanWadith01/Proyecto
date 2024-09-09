<%-- 
    Document   : programarcita
    Created on : 23/08/2024, 08:38:23 AM
    Author     : SENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Programar Cita</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .disabled-input {
            background-color: #f5f5f5;
        }
        .form-control:disabled {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Generar Reporte</h2>
        <form id="reportForm">
            <div class="form-group">
                <label for="documento">Número de Documento</label>
                <input type="text" class="form-control" id="documento" placeholder="Ingrese el número de documento" required>
            </div>
            <div class="form-group">
                <label for="telefono">Número de Teléfono</label>
                <input type="text" class="form-control disabled-input" id="telefono" placeholder="Número de Teléfono" disabled>
            </div>
            <div class="form-group">
                <label for="email">Correo Electrónico</label>
                <input type="email" class="form-control disabled-input" id="email" placeholder="Correo Electrónico" disabled>
            </div>
            <div class="form-group">
                <label for="doctor">Seleccione un Doctor</label>
                <select class="form-control" id="doctor" required>
                    <option value="" disabled selected>Seleccione un doctor</option>
                    <option value="dr_jose">Dr. José Martínez</option>
                    <option value="dr_ana">Dra. Ana Gómez</option>
                    <option value="dr_carlos">Dr. Carlos Rodríguez</option>
                </select>
            </div>
            <div class="form-group">
                <label>Fecha de la Cita:</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="fecha" placeholder="No seleccionada" disabled>
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="selectDate">Seleccionar Fecha</button>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>Hora de la Cita:</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="hora" placeholder="No seleccionada" disabled>
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="selectTime">Seleccionar Hora</button>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="motivo">Motivo de la Cita</label>
                <textarea class="form-control" id="motivo" rows="4"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Programar Cita</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</body>
</html>


