package ClaseAbstractas;

class Circulo extends Figura { }

class Perro extends Animal {
    
    public Perro(String especie, int edad) {
        super(especie, edad);
    }
}

class Informe extends Documento {

    public Informe() {
        super();
    }

    public Informe(String titulo) {
        super(titulo);
    }

    public Informe(String titulo, int paginas) {
        super(titulo, paginas);
    }
}

class Laptop extends Dispositivo {
    
    public Laptop(String marca, double precio) {
        super(marca, precio);
    }

    public Laptop(Laptop l) {
        super(l);
    }
}
