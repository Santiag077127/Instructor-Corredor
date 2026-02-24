//Ejecutar node metodosSinParametrosRetornando.js

//nº1
console.log("Primer Ejemplo: ")

function obtenerSaludo() {
  return "¡Hola! Espero que tengas un excelente día";
}

let mensaje = obtenerSaludo();
console.log(mensaje);

//Nº2
console.log("Segundo Ejemplo: ")

function obtenerFecha() {
  return new Date().toLocaleDateString();
}

let fecha = obtenerFecha();
console.log("Hoy es:", fecha);


//Nº3
console.log("Tercer Ejemplo: ")

function obtenerHora() {
  return new Date().toLocaleTimeString();
}

let hora = obtenerHora();
console.log("La hora actual es:", hora);


//Nª4
console.log("Cuarto Ejemplo: ")
function generarNumero() {
  return Math.floor(Math.random() * 100) + 1;
}

let numero = generarNumero();
console.log("Tu número aleatorio es:", numero);

//Nª5
console.log("Quinto Ejemplo: ")
function obtenerNumeroSecreto() {
  return 69;
}

let secreto = obtenerNumeroSecreto();
console.log("El número secreto es:", secreto);
