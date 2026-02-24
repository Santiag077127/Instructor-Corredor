class AnimalCopia {
    constructor(otroAnimal) {
        this.nombre = otroAnimal.nombre;
        this.sonido = otroAnimal.sonido;
    }

    hacerSonido() {
        console.log(`${this.nombre} hace: ${this.sonido}`);
    }
}

module.exports = AnimalCopia;
