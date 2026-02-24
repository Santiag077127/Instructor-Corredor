package ClaseNormal;

public class Producto {

    public String nombre;
    public double precio;

    //Constructor SOBRECARGADO
    public Producto() {
        this.nombre = "Sin nombre";
        this.precio = 0.0;
    }

    public Producto(String nombre) {
        this.nombre = nombre;
        this.precio = 2000.0;
    }

    public Producto(String nombre, double precio) {
        this.nombre = nombre;
        this.precio = precio;
    }
}

