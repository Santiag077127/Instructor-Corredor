package ClaseNormal;

public class Main {
    public static void main(String[] args) {

        //Constructor SIN PARÁMETROS 
        Usuario u1 = new Usuario();
        System.out.println("Nombre: " + u1.nombre + " Edad: " + u1.edad);
        
        //Constructor CON PARÁMETROS 
        Empleado e1 = new Empleado("Santiago", 2500000);
        System.out.println("Nombre: " + e1.nombre + " Salario: " + e1.salario);

        //Constructor SOBRECARGADO
        Producto p1 = new Producto();
        Producto p2 = new Producto("Teclado");
        Producto p3 = new Producto("Mouse", 50000);

        System.out.println("Producto 1 " + p1.nombre + " $" + p1.precio);
        System.out.println("Producto 2 " + p2.nombre + " $" + p2.precio);
        System.out.println("Producto 3 " + p3.nombre + " $" + p3.precio);

        //  Constructor DE COPIA 
        Vehiculo v1 = new Vehiculo("Toyota", 2020);
        Vehiculo v2 = new Vehiculo(v1);

        System.out.println("Vehiculo Original -> " + v1.marca + ", Modelo " + v1.modelo);
        System.out.println("Vehiculo Copia -> " + v2.marca + ", Modelo " + v2.modelo);
    }
}

