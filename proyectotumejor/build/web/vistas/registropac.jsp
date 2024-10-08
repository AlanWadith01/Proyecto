<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Paciente</title>
    <link rel="stylesheet" href="style.css">
</head>
<style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #333;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    color: #555;
}

input[type="text"],
input[type="tel"],
input[type="date"],
select,
textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 16px;
    color: #333;
}

textarea {
    resize: vertical;
}

button[type="submit"] {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

button[type="submit"]:hover {
    background-color: #0056b3;
}

.center {
    text-align: center;
}
</style>
<body>

    <div class="container">
        <center><h1>REGISTRO DE PACIENTE</h1></center>
        <form method="post" action="#">
            <div class="form-group">
                <label for="numero_identidad">Número de Identidad:</label>
                <input type="text" id="numero_identidad" name="numero_identidad" required>
            </div>
            <div class="form-group">
                <label for="nombre_paciente">Nombre:</label>
                <input type="text" id="nombre_paciente" name="nombre_paciente" required>
            </div>
            <div class="form-group">
                <label for="apellido_paciente">Apellido:</label>
                <input type="text" id="apellido_paciente" name="apellido_paciente" required>
            </div>
            <div class="form-group">
                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion">
            </div>
            <div class="form-group">
                <label for="ciudad">Ciudad:</label>
                <input type="text" id="ciudad" name="ciudad">
            </div>
            <div class="form-group">
                <label for="telefono">Número de Teléfono:</label>
                <input type="tel" id="telefono" name="telefono">
            </div>
            <div class="form-group">
                <label for="estado_civil">Estado Civil:</label>
                <select id="estado_civil" name="estado_civil">
                    <option value="soltero">Soltero/a</option>
                    <option value="casado">Casado/a</option>
                    <option value="viudo">Viudo/a</option>
                    <option value="divorciado">Divorciado/a</option>
                </select>
            </div>
            <div class="form-group">
                <label for="sexo">Sexo:</label>
                <select id="sexo" name="sexo">
                    <option value="masculino">Masculino</option>
                    <option value="femenino">Femenino</option>
                </select>
            </div>
            <div class="form-group">
                <label for="raza">Raza Étnica:</label>
                <select id="raza" name="raza">
                    <option value="mestizo">Mestizo</option>
                    <option value="blanco">Blanco</option>
                    <option value="afrodescendiente">Afrodescendiente</option>
                    <option value="indigena">Indígena</option>
                    <option value="mulato">Mulato</option>
                    <option value="asiatico">Asiático</option>
                    <option value="otro">Otro</option>
                </select>
            </div>
            <div class="form-group">
                <label for="tipo_sangre">Tipo de Sangre:</label>
                <select id="tipo_sangre" name="tipo_sangre">
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
                <label for="ocupacion">Ocupación:</label>
                <input type="text" id="ocupacion" name="ocupacion">
            </div>
            <div class="form-group">
                <label for="eps">EPS:</label>
                <input type="text" id="eps" name="eps">
            </div>
            <div class="form-group">
                <label for="alergias">Alergias:</label>
                <textarea id="alergias" name="alergias" rows="4"></textarea>
            </div>
            <div class="form-group">
                <label for="cirugias">Cirugías:</label>
                <textarea id="cirugias" name="cirugias" rows="4"></textarea>
            </div>
            <div class="form-group">
                <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="fecha_nacimiento" name="fecha_nacimiento">
            </div>
            <h2>Contacto de Emergencia</h2>
            <div class="form-group">
                <label for="nombre_contacto">Nombre y Apellido:</label>
                <input type="text" id="nombre_contacto" name="nombre_contacto" required>
            </div>
            <div class="form-group">
                <label for="direccion_contacto">Dirección:</label>
                <input type="text" id="direccion_contacto" name="direccion_contacto">
            </div>
            <div class="form-group">
                <label for="ciudad_contacto">Ciudad:</label>
                <input type="text" id="ciudad_contacto" name="ciudad_contacto">
            </div>
            <div class="form-group">
                <label for="telefono_contacto">Número de Teléfono:</label>
                <input type="tel" id="telefono_contacto" name="telefono_contacto" required>
            </div>
            <div class="form-group">
                <label for="relacion_contacto">Relación:</label>
                <input type="text" id="relacion_contacto" name="relacion_contacto">
            </div>
            <div class="form-group">
                <center><button type="submit">Registrar</button></center>
            </div>
            <div class="form-group">
                <center><button type="submit">Editar Informacion</button></center>
            </div>
        </form>
    </div>
    
</body>
</html>