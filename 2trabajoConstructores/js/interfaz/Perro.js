const IAnimal = require("./IAnimal");

class Perro extends IAnimal {
    constructor(nombre) {
        super();
        this.nombre = nombre;
    }

    hacerSonido() {
        console.log(`${this.nombre} dice: ¡Guau!`);
    }
}

module.exports = Perro;
