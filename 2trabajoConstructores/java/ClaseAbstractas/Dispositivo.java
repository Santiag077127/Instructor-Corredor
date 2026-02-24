package ClaseAbstractas;

abstract class Dispositivo {

    public String marca;
    public double precio;

    // Constructor copia
    public Dispositivo(String marca, double precio) {
        this.marca = marca;
        this.precio = precio;
    }

    public Dispositivo(Dispositivo copia) {
        this.marca = copia.marca;
        this.precio = copia.precio;
    }
}
