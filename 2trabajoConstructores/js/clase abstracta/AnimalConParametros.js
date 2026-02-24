const Animal = require("./Animal.js");

class AnimalConParametros extends Animal {
    constructor(nombre, sonido) {
        super();
        this.nombre = nombre;
        this.sonido = sonido;
    }

    hacerSonido() {
        console.log(`${this.nombre} hace: ${this.sonido}`);
    }
}

module.exports = AnimalConParametros;
