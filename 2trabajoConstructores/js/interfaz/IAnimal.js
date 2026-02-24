class IAnimal {
    constructor() {
        if (new.target === IAnimal) {
            throw new Error("No puedes instanciar una interfaz.");
        }
    }

    hacerSonido() {
        throw new Error("La clase que implementa la interfaz debe sobrescribir hacerSonido()");
    }
}

module.exports = IAnimal;
