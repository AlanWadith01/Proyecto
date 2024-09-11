<%-- 
    Document   : detallePaciente
    Created on : 5/09/2024, 08:45:26 AM
    Author     : SENA
--%>

<%@page import="Modelo.Paciente"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalles del Paciente</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Detalles del Paciente</h1>
    <%
        Paciente paciente = (Paciente) request.getAttribute("paciente");
    %>
    <ul class="list-group">
        <li class="list-group-item">Nombre: <%= paciente.getNombre() %></li>
        <li class="list-group-item">Apellido: <%= paciente.getApellido() %></li>
        <li class="list-group-item">Fecha de Nacimiento: <%= paciente.getFechaNacimiento() %></li>
        <li class="list-group-item">Tipo de Documento: <%= paciente.getTipoId() %></li>
        <li class="list-group-item">Número de Documento: <%= paciente.getNumeroDocumento() %></li>
        <li class="list-group-item">Dirección: <%= paciente.getDireccion() %></li>
        <li class="list-group-item">Ciudad: <%= paciente.getCiudad() %></li>
        <li class="list-group-item">Teléfono: <%= paciente.getTelefono() %></li>
        <li class="list-group-item">Estado Civil: <%= paciente.getEstadoCivil() %></li>
        <li class="list-group-item">Sexo: <%= paciente.getSexo() %></li>
        <li class="list-group-item">Raza Étnica: <%= paciente.getRaza() %></li>
        <li class="list-group-item">Tipo de Sangre: <%= paciente.getTipoSangre() %></li>
        <li class="list-group-item">Ocupación: <%= paciente.getOcupacion() %></li>
        <li class="list-group-item">EPS: <%= paciente.getEps() %></li>
        <li class="list-group-item">Alergias: <%= paciente.getAlergias() %></li>
        <li class="list-group-item">Cirugías: <%= paciente.getCirugias() %></li>
        <li class="list-group-item">Contacto de Emergencia: <%= paciente.getEmergencyNombre() %></li>
        <li class="list-group-item">Teléfono de Emergencia: <%= paciente.getEmergencyTelefono() %></li>
    </ul>
    <a href="listarPacientes.jsp" class="btn btn-secondary mt-3">Volver a la Lista</a>
</div>
</body>
</html>