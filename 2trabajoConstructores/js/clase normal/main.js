const AnimalSinParametros = require("./AnimalSinParametros.js");
const AnimalConParametros = require("./AnimalConParametros.js");
const AnimalSobrecargado = require("./AnimalSobrecargado.js");
const AnimalCopia = require("./AnimalCopia.js");

class main {
    static ejecutar() {

        console.log("=== SIN PARÁMETROS ===");
        let a1 = new AnimalSinParametros();
        a1.hacerSonido();

        console.log("\n=== CON PARÁMETROS ===");
        let a2 = new AnimalConParametros("Perro", "Guau");
        a2.hacerSonido();

        console.log("\n=== SOBRECARGADO ===");
        let a3 = new AnimalSobrecargado("Gato", "Miau");
        a3.hacerSonido();

        let a3_default = new AnimalSobrecargado();   // Sin parámetros
        a3_default.hacerSonido();

        console.log("\n=== COPIA ===");
        let a4 = new AnimalCopia(a2);
        a4.hacerSonido();
    }
}

main.ejecutar();
