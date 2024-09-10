<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>TU MEJOR SONRISA</title>
    <link rel="stylesheet" href="estyle.css">
    
</head>
<style>

/*hacks y globales*/
html {
    font-size: 62.5%;
    /* 1 rem = 10px */
    box-sizing: border-box;
}

*,
*:before,
*:after {
    box-sizing: inherit;
    /*Hack para box model*/
}

body {
    background-image: url(WhatsApp\ Image\ 2024-07-04\ at\ 11.39.27\ AM.jpeg); /* Ruta de tu imagen de fondo */
    background-size: cover; /* Ajusta la imagen para cubrir todo el fondo */
    background-repeat: no-repeat; /* Evita la repetición de la imagen */
    background-attachment: fixed;
    font-size: 1.6rem;
    line-height: 1.5;
    margin: 0;

}

/* Tipografia */
h1 {
    font-size: 5rem;
}

h2 {
    font-size: 4rem;
}

h1,
h2 {
    line-height: 1.2;
    font-weight: 700;
    text-transform: uppercase;
    text-align: center;
}

p {
    font-weight: 400;
}

a {
    text-decoration: none;
 
}

/* ----- Main ----- */

.fondo {
    position: relative;
    width: 100%;
    height: 100vh;
    background-image: url('WhatsApp\ Image\ 2024-07-04\ at\ 11.39.27\ AM.jpeg');
    background-size: cover;
    background-position: center center;
}

.capa-fondo {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
}



.contenedor {
    height: 100vh;
    width: min(90%, 120rem);
    margin: 0 auto;

    display: flex;
    justify-content: center;
    align-items: center;
}

.contenido {
    background-color: rgba(173, 171, 201, .1);
    padding: 2rem 10rem;
    border-radius: 2rem;
}


.formulario {
    display: grid;
    grid-template-rows: repeat(3, 1fr);
    grid-template-columns: 1fr 3fr;
    gap: 2rem;
    grid-template-areas:
        'label1 field1'
        'label2 field2'
        'blanco boton';
}

.campo1 {
    display: flex;
    align-items: center;
    justify-content: end;
}

.campo2 {
    display: flex;
    align-items: center;
    justify-content: start;
}

.campo3 {
    display: flex;
    align-items: center;
    justify-content: start;
}

.campo4 {
    display: flex;
    align-items: center;
    justify-content: end;
}

.campo__label {
    flex: 0 0 9rem;
    text-align: right;

}

.campo__field {
    border: none;
    border-bottom: .2rem solid;
    padding: 1rem;
    background-color: transparent;
    width: 100%;
}

::-webkit-input-placeholder {
    text-transform: uppercase;
}


/* Boton */
.boton {
    display: block;
    text-align: center;
    font-weight: 700;
    text-transform: uppercase;
    font-size: 1.5rem;
    padding: 1rem 3rem;
    margin-bottom: 2rem;
    border: none;
    border-radius: 2rem;
}

@media (min-width: 768px) {
    .boton {
        display: inline-block;
    }
}

.boton:hover {
    cursor: pointer;
}

.boton--primario {
    background: #ffffff

}

.boton--secundario {
    background-color: transparent;
    
}

/* Registro */

.fondo--registro {
    background-image: url('../img/slide2.jpg');
}

.formulario-registro {
    display: grid;
    grid-template-rows: repeat(4, 1fr);
    grid-template-columns: repeat(2,1fr);
    gap: 3rem;
    grid-template-areas:
        'nombre apellido'
        'email email2'
        'contraseña contraseña2'
        'boton1 boton2';
}

.registro__field {
    border: none;
    padding: 1rem;
  
    background-color: transparent;
    width: 90%;
}

.campoIzq {
    display: flex;
    justify-content:center ;
    align-items: center; 
    padding: 1rem 2rem;
}

.campoDer {
    display: flex;
    justify-content:center ;
    align-items: center;
    padding: 1rem 2rem;
}
</style>

<body>
    
    <section class="fondo">
        <div class="capa-fondo">

            <main class="contenedor">

                <div class="contenido">

                    <h1>TU MEJOR SONRISA</h1>

                    <form class="formulario"> 

                        <div class="campo1"><label class="campo__label Correo" for="Correo">Correo</label></div>
                        <div class="campo2"><input class="campo__field Correo" type="correo" placeholder="Ingrese su correo"
                                id="email"></div>
                        <div class="campo1"><label class="campo__label contraseña" for="password">Contraseña</label>
                        </div>
                        <div class="campo2"><input class="campo__field contraseña-field" type="password"
                                placeholder="Ingrese su contraseña" id="password"></div>
                        <div class="campo3"><a href="registro.html" class="boton boton--secundario" >INICIAR SESIÓN</a></div>
                        <div class="campo4"><input type="submit" value="¿Olvidó Su Contraseña?" class="boton boton--primario"></div>

                    </form>
                </div> <!-- Fin div contendio-->
            </main><!-- Fin div main-->
        </div><!-- Fin div capa de fondo-->
    </section><!-- Fin fondo-->






</body>

</html>