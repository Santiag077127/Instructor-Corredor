package parametrosRetornado;

public class Producto {
    double aplicarDescuento(double precio, double porcentaje) {
        return precio - (precio * porcentaje / 100);
    }

    public static void main(String[] args) {
        Producto p = new Producto();
        double nuevoPrecio = p.aplicarDescuento(1000, 15);
        System.out.println("Precio con descuento: $" + nuevoPrecio);
    }
}

