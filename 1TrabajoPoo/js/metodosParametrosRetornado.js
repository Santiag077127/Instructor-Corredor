// Ejecutar node metodosParametrosRetornado.js

///Ejemplo Nº1:
console.log("Ejemplo Nº1:")
function sumar(a, b) {
  return a + b;
}

let resultado = sumar(5, 3);
console.log("La suma es:", resultado);

//Ejemplo Nº2
console.log("Ejemplo Nº2:")
function cuadrado(numero) {
  return numero * numero;
}
let igual = cuadrado(4);
console.log("El cuadrado es:", igual);

//Ejemplo Nº3
console.log("Ejemplo Nº3:")

function areaTriangulo(base, altura) {
  return (base * altura) / 2;
}

let area = areaTriangulo(10, 5);
console.log("El área del triángulo es:", area);

//Ejemplo Nº4
console.log("Ejemplo Nº4:")

function crearMensaje(nombre) {
  return "Hola, " + nombre + ". ¡Bienvenido!";
}

let mensaje = crearMensaje("Camila");
console.log(mensaje);

//Ejemplo Nº5
console.log("Ejemplo Nº5:")

function esPar(numero) {
  return numero % 2 === 0;
}

let Par = esPar(8);
console.log("¿Es par?", Par);

