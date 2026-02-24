class Animal {
    constructor() {
        if (new.target === Animal) {
            throw new Error("Animal es una clase abstracta y no puede ser instanciada directamente.");
        }
    }

    hacerSonido() {
        throw new Error("El método abstracto hacerSonido() debe ser implementado en la clase hija.");
    }
}

module.exports = Animal;
