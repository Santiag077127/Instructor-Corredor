const Animal = require("./Animal.js");

class AnimalSobrecargado extends Animal {
    constructor(nombre, sonido) {
        super();
        this.nombre = nombre || "Animal por defecto";
        this.sonido = sonido || "Sonido por defecto";
    }

    hacerSonido() {
        console.log(`${this.nombre} hace: ${this.sonido}`);
    }
}

module.exports = AnimalSobrecargado;
