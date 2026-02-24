const AnimalSinParametros = require("./AnimalSinParametros.js");
const AnimalConParametros = require("./AnimalConParametros.js");
const AnimalSobrecargado = require("./AnimalSobrecargado.js");
const AnimalCopia = require("./AnimalCopia.js");

class Main {
    static ejecutar() {
        console.log("=== SIN PARÁMETROS ===");
        const a1 = new AnimalSinParametros();
        a1.hacerSonido();

        console.log("=== CON PARÁMETROS ===");
        const a2 = new AnimalConParametros("Perro", "Guau");
        a2.hacerSonido();

        console.log("=== SOBRECARGADO ===");
        const a3 = new AnimalSobrecargado("Gato", "Miau");
        a3.hacerSonido();

        console.log("=== COPIA ===");
        const a4 = new AnimalCopia(a2);
        a4.hacerSonido();
    }
}

Main.ejecutar();
