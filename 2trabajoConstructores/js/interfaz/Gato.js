const IAnimal = require("./IAnimal");

class Gato extends IAnimal {
    constructor(nombre) {
        super();
        this.nombre = nombre;
    }

    hacerSonido() {
        console.log(`${this.nombre} dice: Miau.`);
    }
}

module.exports = Gato;
