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
    <title>Programación de Citas Médicas</title>
    <link rel="stylesheet" href="style.css">
</head>
<style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
    margin-bottom: 30px;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    color: #555;
}

input[type="text"],
input[type="tel"],
input[type="email"],
input[type="date"],
input[type="time"],
select,
textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 16px;
    color: #333;
}

textarea {
    resize: vertical;
}

button[type="submit"] {
    background-color:  #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    width: 100%;
}

button[type="submit"]:hover {
    background-color:  #007bff;
}

.center {
    text-align: center;
}
</style>
<body>
    <div class="container">
        <h1>Programación de Citas </h1>
        <form action="#" method="post">
            <div class="form-group">
                <label for="nombre">Nombre del Paciente:</label>
                <input type="text" id="nombre" name="nombre" required>
            </div>
            <div class="form-group">
                <label for="telefono">Número de Teléfono:</label>
                <input type="tel" id="telefono" name="telefono" required>
            </div>
            <div class="form-group">
                <label for="email">Correo Electrónico:</label>
                <input type="email" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="doctor">Doctor:</label>
                <select id="doctor" name="doctor" required>
                    <option value="">Seleccione un doctor</option>
                    <option value="dr_jose">Dr. José Martínez</option>
                    <option value="dr_ana">Dra. Ana Gómez</option>
                    <option value="dr_carlos">Dr. Carlos Rodríguez</option>
                </select>
            </div>
            <div class="form-group">
                <label for="fecha">Fecha de la Cita:</label>
                <input type="date" id="fecha" name="fecha" required>
            </div>
            <div class="form-group">
                <label for="hora">Hora de la Cita:</label>
                <input type="time" id="hora" name="hora" required>
            </div>
            <div class="form-group">
                <label for="motivo">Motivo de la Cita:</label>
                <textarea id="motivo" name="motivo" rows="4"></textarea>
            </div>
            <div class="form-group center">
                <button type="submit">Programar Cita</button>
            </div>
        </form>
    </div>
</body>
</html>