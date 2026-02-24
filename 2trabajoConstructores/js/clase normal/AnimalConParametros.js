class AnimalConParametros {
    constructor(nombre, sonido) {
        this.nombre = nombre;
        this.sonido = sonido;
    }

    hacerSonido() {
        console.log(`${this.nombre} hace: ${this.sonido}`);
    }
}

module.exports = AnimalConParametros;
