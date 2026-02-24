package interfaz;

class Celular implements Idispositivo {
    
    public String marca;
    public double precio;

    public Celular(String marca, double precio) {
        this.marca = marca;
        this.precio = precio;
    }

    // Constructor copia
    public Celular(Celular otro) {
        this.marca = otro.marca;
        this.precio = otro.precio;
    }
}
