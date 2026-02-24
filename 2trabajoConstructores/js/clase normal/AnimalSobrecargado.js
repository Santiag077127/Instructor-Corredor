class AnimalSobrecargado {
    constructor(nombre = "Sin nombre", sonido = "Sin sonido") {
        this.nombre = nombre;
        this.sonido = sonido;
    }

    hacerSonido() {
        console.log(`${this.nombre} hace: ${this.sonido}`);
    }
}

module.exports = AnimalSobrecargado;
