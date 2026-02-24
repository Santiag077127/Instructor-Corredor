//Para Ejecutar node metodosSinParametros.js

//nº1
console.log("Primer Ejemplo: ")

function saludar() {
  console.log("¡Hola! Bienvenido al programa");
}
saludar();

//Nº2
console.log("Segundo Ejemplo: ")

function mostrarFecha() {
  console.log("La fecha actual es:", new Date().toLocaleDateString());
}
mostrarFecha();

//Nº3
console.log("Tercer Ejemplo: ")

function mensaje() {
  console.log("Recuerda guardar tu trabajo frecuentemente");
}
mensaje();

//Nª4
console.log("Cuarto Ejemplo: ")

function numeroAleatorio() {
  let numero = Math.floor(Math.random() * 10) + 1;
  console.log("Tu número aleatorio es:", numero);
}
numeroAleatorio();


//Nª5
console.log("Quinto Ejemplo: ")

function buenosDias() {
  console.log("Buenos días! Espero que tengas un excelente día.");
}
buenosDias();

