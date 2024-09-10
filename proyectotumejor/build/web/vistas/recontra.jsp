<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recuperar contraseña</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-image: url('../imagenes/odontologia.jpg');
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      color: white;
      font-family: Arial, sans-serif;
      margin: 0;
      height: 100vh; 
    }
    .fondo {
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      position: relative;
      background-color: rgba(0, 0, 0, 0.5);
    }
    .card-container {
      width: 100%;
      max-width: 400px;
    }
    .card {
      background-color: rgba(173, 171, 201, 0.8); /* Cambiar a un color con opacidad */
      border-radius: 1rem;
    }
  </style>
</head>
<body>
  <div class="fondo">
    <div class="card-container">
      <div class="card shadow">
        <div class="card-body">
          <h2 class="card-title text-center mb-3">Recuperar contraseña</h2>
          <p class="text-center mb-4">Ingresa tu correo electrónico y te enviaremos instrucciones para restablecer tu contraseña.</p>
          <form>
            <div class="mb-3">
              <label for="email" class="form-label">Correo electrónico:</label>
              <input type="email" class="form-control" id="email" placeholder="m@example.com" required>
            </div>
            <div class="d-grid">
              <button type="submit" class="btn btn-primary btn-lg">Recuperar contraseña</button>
            </div>
          </form>
          <div class="text-center mt-4">
            <a href="../vistas/login.jsp" class="btn btn-link">Volver al inicio</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>