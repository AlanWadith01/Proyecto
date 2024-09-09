<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Paciente</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .form-section { margin-bottom: 30px; }
        .form-section h2 { font-size: 24px; font-weight: bold; }
        .error-message { color: red; }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Registro de Paciente</h1>
        
        
        
        <form id="registroPaciente" action="/proyectotumejor/CtrPaciente" method="POST">
            <input type="hidden" name="accion" value="nuevo">
            <div class="form-section">
                <h2>Datos del Paciente</h2>
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                </div>
                <div class="form-group">
                    <label for="apellido">Apellido</label>
                    <input type="text" class="form-control" id="apellido" name="apellido" required>
                </div>
                <div class="form-group">
                    <label for="fechaNacimiento">Fecha de Nacimiento</label>
                    <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" required>
                </div>
                <div class="form-group">
                    <label for="tipoDocumento">Tipo de Documento</label>
                    <select class="form-control" id="tipoDocumento" name="tipoId" required>
                        <option value="" disabled selected>Seleccione un tipo</option>
                        <option value="Cédula Ciudadanía">Cédula Ciudadanía</option>
                        <option value="Tarjeta De Identidad">Tarjeta De Identidad</option>
                        <option value="Cédula Extranjera">Cédula Extranjera</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="numeroDocumento">Número de Documento</label>
                    <input type="text" class="form-control" id="numeroDocumento" name="numeroDocumento" required pattern="\d+" title="Solo se permiten números">
                </div>
                <div class="form-group">
                    <label for="direccion">Dirección</label>
                    <input type="text" class="form-control" id="direccion" name="direccion" required>
                </div>
                <div class="form-group">
                    <label for="ciudad">Ciudad</label>
                    <input type="text" class="form-control" id="ciudad" name="ciudad" required>
                </div>
                <div class="form-group">
                    <label for="telefono">Número de Teléfono</label>
                    <input type="tel" class="form-control" id="telefono" name="telefono" required pattern="\d{10}" title="Número de teléfono debe tener 10 dígitos">
                </div>
                <div class="form-group">
                    <label for="estadoCivil">Estado Civil</label>
                    <select class="form-control" id="estadoCivil" name="estadoCivil" required>
                        <option value="" disabled selected>Seleccione un estado</option>
                        <option value="Soltero/a">Soltero/a</option>
                        <option value="Casado/a">Casado/a</option>
                        <option value="Viudo/a">Viudo/a</option>
                        <option value="Divorciado/a">Divorciado/a</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="sexo">Sexo</label>
                    <select class="form-control" id="sexo" name="sexo" required>
                        <option value="" disabled selected>Seleccione un sexo</option>
                        <option value="Masculino">Masculino</option>
                        <option value="Femenino">Femenino</option>
                        <option value="Prefiero no decirlo">Prefiero no decirlo</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="raza">Raza Étnica</label>
                    <select class="form-control" id="raza" name="raza" required>
                        <option value="" disabled selected>Seleccione una raza</option>
                        <option value="Mestizo">Mestizo</option>
                        <option value="Blanco">Blanco</option>
                        <option value="Afrodescendiente">Afrodescendiente</option>
                        <option value="Indígena">Indígena</option>
                        <option value="Mulato">Mulato</option>
                        <option value="Asiático">Asiático</option>
                        <option value="Otro">Otro</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="tipoSangre">Tipo de Sangre</label>
                    <select class="form-control" id="tipoSangre" name="tipoSangre" required>
                        <option value="" disabled selected>Seleccione un tipo</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="ocupacion">Ocupación</label>
                    <input type="text" class="form-control" id="ocupacion" name="ocupacion">
                </div>
                <div class="form-group">
                    <label for="eps">EPS</label>
                    <input type="text" class="form-control" id="eps" name="eps">
                </div>
                <div class="form-group">
                    <label for="alergias">Alergias</label>
                    <textarea class="form-control" id="alergias" name="alergias" rows="3"></textarea>
                </div>
                <div class="form-group">
                    <label for="cirugias">Cirugías</label>
                    <textarea class="form-control" id="cirugias" name="cirugias" rows="3"></textarea>
                </div>
            </div>
            <div class="form-section">
                <h2>Contacto de Emergencia</h2>
                <div class="form-group">
                    <label for="emergencyNombre">Nombre y Apellido</label>
                    <input type="text" class="form-control" id="emergencyNombre" name="emergencyNombre" required>
                </div>
                <div class="form-group">
                    <label for="emergencyDireccion">Dirección</label>
                    <input type="text" class="form-control" id="emergencyDireccion" name="emergencyDireccion" required>
                </div>
                <div class="form-group">
                    <label for="emergencyCiudad">Ciudad</label>
                    <input type="text" class="form-control" id="emergencyCiudad" name="emergencyCiudad" required>
                </div>
                <div class="form-group">
                    <label for="emergencyTelefono">Número de Teléfono</label>
                    <input type="tel" class="form-control" id="emergencyTelefono" name="emergencyTelefono" required>
                </div>
                <div class="form-group">
                    <label for="emergencyRelacion">Relación</label>
                    <input type="text" class="form-control" id="emergencyRelacion" name="emergencyRelacion">
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Registrar</button>
                <button type="reset" class="btn btn-secondary">Limpiar</button>
            </div>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>