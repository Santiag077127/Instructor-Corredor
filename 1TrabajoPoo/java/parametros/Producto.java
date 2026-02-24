package parametros;

public class Producto {
    void mostrarDatos(String nombre, double precio) {
        System.out.println("Producto: " + nombre + " - Precio: $" + precio);
    }

    public static void main(String[] args) {
        Producto p = new Producto();
        p.mostrarDatos("Celular", 899.99);
    }
}
