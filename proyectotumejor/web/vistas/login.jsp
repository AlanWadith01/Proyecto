<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <title>Login Page</title>
    <style>
        body {
            background-image: url('../imagenes/odontologia.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            backface-visibility: hidden auto;
            color: white;
            font-family: Arial, sans-serif;
            margin: 0;
        }
        .fondo {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .contenido {
            background-color: rgba(173, 171, 201, 0.1);
            padding: 3rem;
            border-radius: 1rem;
            max-width: 500px;
            width: 100%;
        }
        .form-label {
            color: white;
            font-weight: bold;
        }
        .form-control {
            background-color: transparent;
            border: none;
            border-bottom: 2px solid white;
            color: white;
        }
        .btn-outline-light {
            background-color: #007bff;
            color: white;
        }
    </style>
     <%
                            // Manejo de mensajes de error
                            String mensaje = "";
                            if (request.getParameter("ingreso") != null) {
                                int ingreso = Integer.parseInt(request.getParameter("ingreso"));
                                if (ingreso == 0) {
                                    mensaje = "Error: Datos Incorrectos";
                                }
                            }
                        %>
</head>
<body>
    <section class="fondo">
        <div class="contenido">
            <h1 class="mb-4 text-center">TU MEJOR SONRISA</h1>
            <form class="form-sing" method="post" action="/proyectotumejor/CtrValidar">
                <div class="mb-3">
                    <label class="form-label">Usuario:</label>
                    <input name="txtuser" class="form-control" placeholder="Ingrese su usuario" >
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña:</label>
                    <input type="password" name="txtpass" class="form-control" placeholder="Ingrese su contraseña">
                </div>
                <div class="d-grid gap-2">
                    <a href="recontra.jsp" class="btn btn-link">¿Olvidó Su Contraseña?</a>
                    <center>
                        <input type="submit" name="accion" value="Ingresar" class="btn btn-primary btn-block">
                       
                        <p style="color: red;"><%= mensaje %></p>
                    </center> 
                </div>
            </form>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>