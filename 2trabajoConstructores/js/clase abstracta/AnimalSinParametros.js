const Animal = require("./Animal.js");

class AnimalSinParametros extends Animal {
    constructor() {
        super();
        this.nombre = "Animal genérico";
        this.sonido = "sonido desconocido";
    }

    hacerSonido() {
        console.log(`${this.nombre} hace: ${this.sonido}`);
    }
}

module.exports = AnimalSinParametros;
