<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Panel de Control - Tu Mejor Sonrisa</title>
    <style>
        body {
            background-color: #f0f0f0;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .container {
            margin-top: 20px;
        }
    </style>
    <%
        if (session.getAttribute("log") == null || session.getAttribute("log").equals('0')){
            response.sendRedirect("../vistas/login.jsp");
        }
    %>
</head>
<body>
    <div class="header">
        <h1>Bienvenido a Tu Mejor Sonrisa</h1>
        <h3>Odontólogo: <%= session.getAttribute("nombres") + " " + session.getAttribute("apellidos") %></h3>
         <div class="col-md-3">
                <a href="/proyectotumejor/vistas/ListarOdontologos.jsp" class="btn btn-success btn-block">Odontologos</a>
            </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <a href="/proyectotumejor/vistas/registropac.jsp" class="btn btn-primary btn-block">Registrar Paciente</a>
            </div>
            <div class="col-md-3">
                <a href="/proyectotumejor/vistas/Listarpacientes.jsp" class="btn btn-secondary btn-block">Listar Pacientes</a>
            </div>
            <div class="col-md-3">
                <a href="/proyectotumejor/vistas/programarcita.jsp" class="btn btn-success btn-block">Programar Cita</a>
            </div>
            
        </div>

        <div class="row mt-4">
            <div class="col-md-12">
                <a href="login.jsp" class="btn btn-danger btn-block">Cerrar Sesión</a>
            </div>
        </div>

        <h2 class="mt-4">Citas Pendientes</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Nombre Paciente</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Descripción</th>
                </tr>
            </thead>
            <tbody>
                <!-- Aquí puedes usar JSTL o scriptlets para mostrar las citas -->
                <c:forEach var="cita" items="${citasPendientes}">
                    <tr>
                        <td>${cita.nombrePaciente}</td>
                        <td>${cita.fecha}</td>
                        <td>${cita.hora}</td>
                        <td>${cita.descripcion}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>