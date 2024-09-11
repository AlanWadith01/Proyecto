<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Programar Cita</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .disabled-input {
            background-color: #f5f5f5;
        }
        .form-control:disabled {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Programar Cita</h2>
        <form id="reportForm" method="post" action="/proyectotumejor/CtrCitas" onsubmit="return validarFormulario()"> 
            <div class="form-group">
                <label for="idpac">Número de Documento</label>
                <input type="text" class="form-control" id="idpac" name="idpac" placeholder="Ingrese el número de documento" onkeyup="buscarPaciente()" required>
            </div>
            <div class="form-group">
                <label for="nombrepac">Nombre paciente</label>
                <input type="text" class="form-control" id="nombrepac" name="nombrepac" placeholder="Nombre paciente" required>
            </div>
            <div class="form-group">
                <label for="apepac">Apellido paciente</label>
                <input type="text" class="form-control" id="apepac" name="apepac" placeholder="Apellido paciente" required>
            </div>
            <div class="form-group">
                <label for="odontologo">Seleccione un Doctor</label>
                <select class="form-control" id="odontologo" name="odontologo" required>
                    <option value="" disabled selected>Seleccione un doctor</option>
                    <option value="98765421">Dr. Katryn Gonzalez</option>
                    <option value="dr_ana">Dra. Ana Gómez</option>
                    <option value="dr_carlos">Dr. Carlos Rodríguez</option>
                </select>
            </div>
            <div class="form-group">
                <label for="fechacit">Fecha de la Cita:</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="fechacit" name="fechacit" placeholder="No seleccionada" disabled>
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="selectDate">Seleccionar Fecha</button>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="horacit">Hora de la Cita:</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="horacit" name="horacit" placeholder="No seleccionada" disabled>
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="selectTime">Seleccionar Hora</button>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="motivo">Motivo de la Cita</label>
                <textarea class="form-control" id="motivo" name="motivo" rows="4" placeholder="Ingrese el motivo de la cita" required></textarea>
            </div>
            <center>
                <a href="/proyectotumejor/vistas/acceso.jsp" class="btn btn-secondary btn-block">Cancelar Cita</a>
                <input type="submit" name="accion" value="Generar" class="btn btn-primary btn-block">
            </center> 
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        document.getElementById('selectDate').addEventListener('click', function() {
            const selectedDate = prompt("Ingrese la fecha de la cita (YYYY-MM-DD):");
            if (selectedDate) {
                document.getElementById('fechacit').value = selectedDate;
                document.getElementById('fechacit').disabled = false; // Enable the input after selection
            }
        });

        document.getElementById('selectTime').addEventListener('click', function() {
            const selectedTime = prompt("Ingrese la hora de la cita (HH:MM):");
            if (selectedTime) {
                document.getElementById('horacit').value = selectedTime;
                document.getElementById('horacit').disabled = false; // Enable the input after selection
            }
        });

        function buscarPaciente() {
            var idPaciente = document.getElementById("idpac").value;
            if (idPaciente.length === 0) {
                document.getElementById("nombrepac").value = '';
                document.getElementById("apepac").value = '';
                return; // Si no hay ID, limpiar los campos y salir
            }

            // Crear una instancia de XMLHttpRequest
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "/proyectotumejor/CtrPaciente?accion=buscaridpac&idpac=" + idPaciente, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var paciente = JSON.parse(xhr.responseText);
                    if (paciente) {
                        document.getElementById("nombrepac").value = paciente.nombre;
                        document.getElementById("apepac").value = paciente.apellido;
                    } else {
                        document.getElementById("nombrepac").value = '';
                        document.getElementById("apepac").value = '';
                    }
                }
            };
            xhr.send();
        }

        function validarFormulario() {
            // Obtener los valores de los campos
            var idpac = document.getElementById("idpac").value.trim();
            var nombrepac = document.getElementById("nombrepac").value.trim();
            var apepac = document.getElementById("apepac").value.trim();
            var odontologo = document.getElementById("odontologo").value;
            var fechacit = document.getElementById("fechacit").value.trim();
            var horacit = document.getElementById("horacit").value.trim();
            var motivo = document.getElementById("motivo").value.trim();

            // Verificar si los campos obligatorios están vacíos
            if (!idpac || !nombrepac || !apepac || !odontologo || !motivo) {
                alert("Por favor, complete todos los campos obligatorios.");
                return false; // Evitar el envío del formulario
            }

            // Si se requiere validar la fecha y la hora, puedes descomentar las siguientes líneas
            // if (!fechacit || !horacit) {
            //     alert("Por favor, seleccione la fecha y la hora de la cita.");
            //     return false; // Evitar el envío del formulario
            // }

            return true; // Permitir el envío del formulario
        }
    </script>
</body>
</html>