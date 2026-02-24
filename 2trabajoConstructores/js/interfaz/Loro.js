const IAnimal = require("./IAnimal");

class Loro extends IAnimal {
    constructor(nombre, frase) {
        super();
        this.nombre = nombre;
        this.frase = frase;
    }

    hacerSonido() {
        console.log(`${this.nombre} dice: ${this.frase}`);
    }
}

module.exports = Loro;
