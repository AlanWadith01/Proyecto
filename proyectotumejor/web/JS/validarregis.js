// Expresiones regulares para validaciones
const expresiones = {
    nombre: /^[a-zA-ZÀ-ÿ\s]{3,40}$/, // Letras y espacios, pueden llevar acentos.
    apellido: /^[a-zA-ZÀ-ÿ\s]{3,40}$/, // Letras y espacios, pueden llevar acentos.
    numeroDocumento: /^\d{7,10}$/, // 7 a 10 números.
    direccion: /^[a-zA-Z0-9\s\#\-\.,]{4,40}$/, // Letras, números y caracteres permitidos.
    ciudad: /^[a-zA-ZÀ-ÿ\s]{3,40}$/, // Letras y espacios, pueden llevar acentos.
    telefono: /^\d{10}$/ // 10 dígitos numéricos.
};

const campos = {
    nombre: false,
    apellido: false,
    numeroDocumento: false,
    direccion: false,
    ciudad: false,
    telefono: false
};

// Función para validar un campo específico
function validarCampo(expresion, input, campo) {
    if(expresion.test(input.value)){
        document.getElementById(`grupo_${campo}`).classList.remove('formulario_grupo-incorrecto');
        document.getElementById(`grupo_${campo}`).classList.add('formulario_grupo-correcto');
        document.querySelector(`#grupo_${campo} .formulario_input-error`).classList.remove('formulario_input-error-activo');
        campos[campo] = true;
    } else {
        document.getElementById(`grupo_${campo}`).classList.add('formulario_grupo-incorrecto');
        document.getElementById(`grupo_${campo}`).classList.remove('formulario_grupo-correcto');
        document.querySelector(`#grupo_${campo} .formulario_input-error`).classList.add('formulario_input-error-activo');
        campos[campo] = false;
    }
}

// Eventos para validar los campos
document.querySelectorAll('input, select').forEach((input) => {
    input.addEventListener('keyup', (e) => {
        switch (e.target.name) {
            case "nombre":
                validarCampo(expresiones.nombre, e.target, 'nombre');
                break;
            case "apellido":
                validarCampo(expresiones.apellido, e.target, 'apellido');
                break;
            case "numeroDocumento":
                validarCampo(expresiones.numeroDocumento, e.target, 'numeroDocumento');
                break;
            case "direccion":
                validarCampo(expresiones.direccion, e.target, 'direccion');
                break;
            case "ciudad":
                validarCampo(expresiones.ciudad, e.target, 'ciudad');
                break;
            case "telefono":
                validarCampo(expresiones.telefono, e.target, 'telefono');
                break;
        }
    });
});

// Validar el formulario antes de enviarlo
document.getElementById('registroPaciente').addEventListener('submit', (e) => {
    e.preventDefault();

    if(campos.nombre && campos.apellido && campos.numeroDocumento && campos.direccion && campos.ciudad && campos.telefono){
        alert('Formulario enviado correctamente');
        document.getElementById('registroPaciente').submit();
    } else {
        alert('Por favor, rellene correctamente todos los campos requeridos.');
    }
});
