<%-- 
    Document   : ListarOdontologos
    Created on : 10/09/2024, 08:16:37 AM
    Author     : SENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <table class="table table-bordered">
            <thead class="thead-light border">
                <tr table-success>
                    <th scope="col" class="text-center border"><a class="btn btn-primary ml-2" href="/proyectotumejor/vistas/registropac.jsp"><i class="bi bi-person-add"></i></a></th><th scope="col" colspan="9" class="text-center border">Odontologos</th>
                    
                </tr>
            </thead>
            
        <tr>
            <th scope="col" class="text-center border">Id</th>
            <th scope="col" class="text-center border">Nombres</th>
            <th scope="col" class="text-center border">Apellidos</th>
            <th scope="col" class="text-center border">Usuario</th>
            <th scope="col" class="text-center border">Tipo</th>
            

            <th scope="col" class="text-center border">Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="odo" items="${odontologos}">  
            <tr>
                <th scope="row" class="border">${odo.getId()}</th>
                <td class="border">${odo.getNombres()}</td>
                <td class="border">${odo.getApellidos()}</td>
                <td class="border">${odo.getUsuario()}</td>
                <td class="border">${odo.Tipo()}</td>
                
                <td class=" text-center border">
                    <input type="hidden" name="id" id="id" value="${odo.getId()}">
                    <a class="btn btn-warning" href="/proyectotumejor/CtrOdontologo?accion=editar&id=${pac.getId()}"><i class="bi bi-pencil-fill"></i></a>
                    <a class="btn btn-danger" id="btndetalle" href="/proyectotumejor/vistas/detallePaciente.jsp"><i class="bi bi-trash-fill"></i></i></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    </body>
</html>
