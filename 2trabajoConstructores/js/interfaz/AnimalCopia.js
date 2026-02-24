const IAnimal = require("./IAnimal");

class AnimalCopia extends IAnimal {
    constructor(otroAnimal) {
        super();
        this.nombre = otroAnimal.nombre;
        this.sonido = otroAnimal.hacerSonido; 
    }

    hacerSonido() {
        console.log(`Copia:`);
        this.sonido();
    }
}

module.exports = AnimalCopia;
