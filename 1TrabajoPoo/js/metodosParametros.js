//Para Ejecutar node metodosParametros.js

//nº1
console.log("Primer Ejemplo: ")

function saludar(nombre) {
  console.log("¡Hola, " + nombre + "!");
}

saludar("Santiago Gordo Perez");


//nº2
console.log("Segundo Ejemplo: ")

function mostrarDoble(numero) {
  console.log("El doble de " + numero + " es: " + (numero * 2));
}

mostrarDoble(6);



//nº3
console.log("Tercer Ejemplo: ")

function presentar(nombre = "Invitado") {
  console.log("Bienvenido, " + nombre);
}

presentar("Santiago");


///nº4
console.log("Cuarto Ejemplo: ")

function mensajePersonalizado(nombre, edad) {
  console.log(`Hola ${nombre}, tienes ${edad} años.`);
}

mensajePersonalizado("Santiago", 18);


//nº5
console.log("Quinto Ejemplo: ")

function calcularArea(base, altura) {
  let area = base * altura;
  console.log("El área del rectángulo es:", area);
}

calcularArea(5, 3);
