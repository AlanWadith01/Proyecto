<%-- 
    Document   : registroOdontologo
    Created on : 28/08/2024, 03:39:54 PM
    Author     : SENA
--%>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Odontologo</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .form-section { margin-bottom: 30px; }
        .form-section h2 { font-size: 24px; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Registro de Odontologo</h1>

        <% 
            // Mostrar mensaje de �xito o error basado en el par�metro de la solicitud
            String successMessage = request.getParameter("success");
            String errorMessage = request.getParameter("error");
        %>

        <% if ("true".equals(successMessage)) { %>
            <div class="alert alert-success text-center">
                <strong>�Registro exitoso! El odont�logo se ha registrado correctamente.</strong>
            </div>
        <% } else if ("true".equals(errorMessage)) { %>
            <div class="alert alert-danger text-center">
                <strong>Error al registrar el odont�logo. Verifique los datos e intente nuevamente.</strong>
            </div>
        <% } else if ("passwordMismatch".equals(request.getParameter("error"))) { %>
            <div class="alert alert-danger text-center">
                <strong>Las contrase�as no coinciden. Por favor, int�ntelo de nuevo.</strong>
            </div>
        <% } else if ("missingId".equals(request.getParameter("error"))) { %>
            <div class="alert alert-danger text-center">
                <strong>El ID es obligatorio. Por favor, ingr�selo.</strong>
            </div>
        <% } %>

        <form id="registroOdontologo" action="/CtrOdontologo" method="POST">
            <div class="form-section">
                <h2>Datos del Odontologo</h2>
                <div class="form-group">
                    <label for="id">ID</label>
                    <input type="text" class="form-control" id="id" name="id" required>
                </div>
                <div class="form-group">
                    <label for="nombres">Nombres</label>
                    <input type="text" class="form-control" id="nombres" name="nombres" required>
                </div>
                <div class="form-group">
                    <label for="apellidos">Apellidos</label>
                    <input type="text" class="form-control" id="apellidos" name="apellidos" required>
                </div>
                <div class="form-group">
                    <label for="usuario">Usuario</label>
                    <input type="text" class="form-control" id="usuario" name="usuario" required>
                </div>
                <div class="form-group">
                    <label for="contrasena">Contrase�a</label>
                    <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                </div>
                <div class="form-group">
                    <label for="confirmarContrasena">Confirmar Contrase�a</label>
                    <input type="password" class="form-control" id="confirmarContrasena" name="confirmarContrasena" required>
                </div>
                <div class="form-group">
                    <label for="tipo">Tipo</label>
                    <select class="form-control" id="tipo" name="tipo" required>
                        <option value="Administrador">Administrador</option>
                        <!-- Otras opciones pueden ser a�adidas aqu� -->
                    </select>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Registrar</button>
                </div>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>