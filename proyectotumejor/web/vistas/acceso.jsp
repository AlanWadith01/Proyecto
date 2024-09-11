<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tu Mejor Sonrisa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body {
            background-image: url('../imagenes/odontologia.jpg');
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .header {
            background-image: url('../mejor.jpg');
            background-color: #00aaff;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .header .title {
            font-size: 2rem;
            font-weight: bold;
        }

        .header .sign-out {
            font-size: 1rem;
            cursor: pointer;
            background-color: #ff4d4d;
            padding: 8px 16px;
            border-radius: 0.5rem;
            color: white;
            text-decoration: none;
            transition: background-color 0.3s, transform 0.3s;
        }

        .header .sign-out:hover {
            background-color: #cc0000;
            transform: scale(1.05);
        }

        .container {
            padding: 30px;
        }

        .button-row {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
        }

        .button-row button {
            flex: 1;
            padding: 14px;
            font-size: 18px;
            border-radius: 0.5rem;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .button-row .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .button-row .btn-primary:hover {
            background-color: #007bff;
            border-color: #007bff;
        }

        .button-row .btn-secondary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .button-row .btn-secondary:hover {
            background-color: #007bff;
            border-color: #007bff;
        }

        .button-row .btn-success {
            background-color: #007bff;
            border-color: #007bff;
        }

        .button-row .btn-success:hover {
            background-color: #007bff;
            border-color: #007bff;
        }
        

        .search-bar {
            margin-bottom: 30px;
        }

        .appointment-list {
            background-color: white;
            padding: 20px;
            border-radius: 0.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .appointment-list table {
            width: 100%;
            border-collapse: collapse;
        }

        .appointment-list th, .appointment-list td {
            padding: 15px;
            text-align: center;
            border: 1px solid #dee2e6;
        }

        .appointment-list th {
            background-color: #e9ecef;
            font-weight: bold;
        }

        .footer-buttons {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .footer-buttons button {
            flex: 1;
            padding: 14px;
            font-size: 18px;
            border-radius: 0.5rem;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .footer-buttons .btn-info {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }

        .footer-buttons .btn-info:hover {
            background-color: #138496;
            border-color: #117a8b;
        }

        .footer-buttons .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }

        .footer-buttons .btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }

        .form-inline {
            display: flex;
            align-items: center;
        }

        .form-inline .form-control {
            border-radius: 0.375rem;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.075);
        }

        .form-inline .btn {
            border-radius: 0.375rem;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .form-inline .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .form-inline .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="title ">Tu Mejor Sonrisa</div>
  <div class="col-1">
    <ul class="nav nav-pills nav-fill">
      <li class="nav-item dropdown">
        <a class="nav-link active dropdown-toggle navbar-brand" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expandes="false"><i class="bi bi-list" style="font-size: 1.5rem;"></i></a>
        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          <li><a class="dropdown-item" href="/proyectotumejor/CtrPaciente?accion=listar" data-bs-target="#item"><i class="bi bi-person-lines-fill"></i> Pacientes</a></li>
          <li><a class="dropdown-item" href="/proyectotumejor/CtrOdontologo?accion=Listar" data-bs-target="#item"><i class="bi bi-person-lines-fill"></i> Odontologos</a></li>
          <li><a class="dropdown-item" href="#" data-bs-target="#item"><i class="bi bi-bookmark-star"></i> Tratamientos</a></li>
          <li><a class="dropdown-item" href="#" data-bs-target="#item"><i class="bi bi-flag"></i> Reportes</a></li>
        </ul>
      </li>
    </ul>
    
  </div>
  <a href="#" class="sign-out">Cerrar sesión</a>
</header>

    <div class="container">
        <div class="button-row">
           <button class="btn btn-primary" onclick="window.location.href='/proyectotumejor/vistas/programarcita.jsp'">Programar Cita</button>
            <button class="btn btn-secondary" onclick="window.location.href='/proyectotumejor/vistas/programarretra.jsp'">Programar Retratamiento</button>
            <button class="btn btn-success" onclick="window.location.href='/proyectotumejor/vistas/Generarreporte.jsp'">Generar Reportes</button>
        </div>

        <div class="row mb-4">
            <div class="col-md-12">
                <form class="form-inline d-flex justify-content-end">
                    <input type="text" class="form-control me-2" placeholder="Digite nombre" aria-label="Buscar">
                    <button type="submit" class="btn btn-success">
                        <i class="bi bi-search"></i> Buscar
                    </button>
                </form>
            </div>
        </div>

        <div class="appointment-list">
            <table>
                <thead>
                    <tr>
                        <th colspan="8">CITAS</th>
                    </tr>
                    <tr>
                        
                        <th>Identificación</th>
                        <th>Nombre Paciente</th>
                        <th>Apellido Paciente</th>
                        <th>Odontólogo</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Descripción de Cita</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                  <tbody>
        <c:forEach var="cit" items="${citas}">  
            <tr>
                <th class="border">${cit.getId_pac()}</th>
                <td class="border">${cit.getNombrepac()}</td>
                <td class="border">${cit.getApellidopac()}</td>
                <td class="border">${cit.getId_odon()}</td>
                <td class="border">${cit.getFechacita()}</td>
                <td class="border">${cit.getHoracita()}</td>
                <td class=" border">${cit.getDescripcioncita()}</td>
                

                <td class=" text-center border">
                    <input type="hidden" name="id" id="id" value="${cit.getId()}">
                    <a class="btn btn-warning" href="/proyectotumejor/CtrPaciente?accion=editar&id=${pac.getId()}"><i class="bi bi-pencil-fill"></i></a>
                    <a class="btn btn-danger" id="btndetalle" href="/proyectotumejor/vistas/detallePaciente.jsp"><i class="bi bi-trash-fill"></i></i></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
            </table>
        </div>

       
    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    </html>