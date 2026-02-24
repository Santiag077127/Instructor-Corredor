class AnimalSinParametros {
    constructor() {
        this.nombre = "Desconocido";
        this.sonido = "Sonido indefinido";
    }

    hacerSonido() {
        console.log(`${this.nombre} hace: ${this.sonido}`);
    }
}

module.exports = AnimalSinParametros;
