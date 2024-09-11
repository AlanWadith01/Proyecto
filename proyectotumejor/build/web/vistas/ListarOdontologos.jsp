<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Listar Odontólogos</title>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Lista de Odontólogos</h1>
        
        <div class="row mb-4">
            <div class="col-sm-8"></div>
            <div class="col-sm-4">
                <form class="form-inline" action="">
                    <div class="form-group mx-sm-3">
                        <input type="text" class="form-control" name="txtbuscar" placeholder="Digite nombre">
                    </div>
                    <button type="submit" class="btn btn-success" name="accion" value="buscar">
                        <i class="bi bi-search"></i> Buscar
                    </button>
                </form>
            </div>
        </div>
        
        <table class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th scope="col" class="text-center">Id</th>
                    <th scope="col" class="text-center">Nombre</th>
                    <th scope="col" class="text-center">Apellido</th>
                    <th scope="col" class="text-center">Usuario</th>
                    <th scope="col" class="text-center">Tipo</th>
                    <th scope="col" class="text-center">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="odo" items="${odontologos}">
                    <tr>
                        <th scope="row" class="text-center">${odo.getId()}</th>
                        <td class="text-center">${odo.getNombres()}</td>
                        <td class="text-center">${odo.getApellidos()}</td>
                        <td class="text-center">${odo.getUsuario()}</td>
                        <td class="text-center">${odo.getTipo()}</td>
                        <td class="text-center">
                            <input type="hidden" name="id" id="id" value="${odo.getId()}">
                            <a class="btn btn-warning" href="/proyectotumejor/CtrOdontologo?accion=editar&id=${odo.getId()}">
                                <i class="bi bi-pencil-fill"></i> Editar
                            </a>
                            <a class="btn btn-danger" id="btneliminar" href="/proyectotumejor/CtrOdontologo?accion=eliminar&id=${odo.getId()}" onclick="return confirm('¿Está seguro de que desea eliminar este odontólogo?');">
                                <i class="bi bi-trash-fill"></i> Eliminar
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <div class="row">
            <div class="col text-center">
                <a class="btn btn-danger" href="/proyectotumejor/vistas/acceso.jsp">
                    <i class="bi bi-house-fill"></i> Inicio
                </a>
                <a class="btn btn-danger" href="/proyectotumejor/vistas/registroOdontologo.jsp">
                    <i class="bi bi-person-add"></i> Nuevo Odontologo
                </a>
            </div>
        </div>
        
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../JS/Funcioneliminar.js" type="text/javascript"></script>
</body>
</html>