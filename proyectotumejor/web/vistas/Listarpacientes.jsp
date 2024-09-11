
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <title>Listar Usuarios</title>
    </head>

    <body>
        <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <form class="form-inline mt-4" action="">
                        <div class="form-group mx-sm-3 mb-2">
                            <input type="text" class="form-control" name="txtbuscar" placeholder="Digite Su Identificacion">
                        </div>
                        <button type="submit" class="btn btn-success mb-2" name="accion" value="buscar"><i class="bi bi-search"></i> Buscar</button>
                    </form>
                </div>
            </div>
        <table class="table table-bordered">
            <thead class="thead-light border">
                <tr table-success>
                    <th scope="col" class="text-center border"><a class="btn btn-primary ml-2" href="/proyectotumejor/vistas/registropac.jsp"><i class="bi bi-person-add"></i></a></th><th scope="col" colspan="9" class="text-center border">Pacientes</th>
                    
                </tr>
            </thead>
            
        <tr>
            <th scope="col" class="text-center border">Id</th>
            <th scope="col" class="text-center border">Nombres</th>
            <th scope="col" class="text-center border">Apellidos</th>
            <th scope="col" class="text-center border">Edad</th>
            <th scope="col" class="text-center border">Direccion</th>
            <th scope="col" class="text-center border">Telefono</th>
            <th scope="col" class="text-center border">Email</th>

            <th scope="col" class="text-center border">Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="pac" items="${pacientes}">  
            <tr>
                <th scope="row" class="border">${pac.getId()}</th>
                <td class="border">${pac.getNombre()}</td>
                <td class="border">${pac.getApellido()}</td>
                <td class="border">${pac.getEdad()}</td>
                <td class="border">${pac.getDireccion()}</td>
                <td class="border">${pac.getTelefono()}</td>
                <td class="border">${pac.getEmail()}</td>

                <td class=" text-center border">
                    <input type="hidden" name="id" id="id" value="${pac.getId()}">
                    <a class="btn btn-warning" href="/proyectotumejor/CtrPaciente?accion=editar&id=${pac.getId()}"><i class="bi bi-pencil-fill"></i></a>
                    <a class="btn btn-danger" id="btndetalle" href="/proyectotumejor/vistas/detallePaciente.jsp"><i class="bi bi-trash-fill"></i></i></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>                        
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>  
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
    </body>
</html>
