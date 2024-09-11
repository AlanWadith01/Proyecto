<%-- 
    Document   : Listarpacientes
    Created on : 23/08/2024, 08:38:04 AM
    Author     : SENA
--%>


<%@page import="Modelo.Paciente"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Pacientes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Lista de Pacientes</h1>
    <table class="table">
        <thead>
        <tr>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Teléfono</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Paciente> pacientes = (List<Paciente>) request.getAttribute("pacientes");
            for (int i = 0; i < pacientes.size(); i++) {
                Paciente p = pacientes.get(i);
        %>
        <tr>
            <td><%= p.getNombre() %></td>
            <td><%= p.getApellido() %></td>
            <td><%= p.getTelefono() %></td>
            <td>
                <a href="CtrPaciente?accion=detalle&index=<%= i %>" class="btn btn-info">Detalles</a>
            </td>
        </tr>
        
        </tbody>
    </table>
    <a href="registroPaciente.jsp" class="btn btn-primary">Registrar Nuevo Paciente</a>
</div>
</body>
</html>