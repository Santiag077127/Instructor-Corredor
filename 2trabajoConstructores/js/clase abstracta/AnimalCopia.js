const Animal = require("./Animal.js");

class AnimalCopia extends Animal {
    constructor(otroAnimal) {
        super();
        this.nombre = otroAnimal.nombre;
        this.sonido = otroAnimal.sonido;
    }

    hacerSonido() {
        console.log(`${this.nombre} (copia) hace: ${this.sonido}`);
    }
}

module.exports = AnimalCopia;
