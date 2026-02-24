package ClaseAbstractas;

public class Main {

    public static void main(String[] args) {

        // Constructor sin parámetros

        Circulo c = new Circulo();
        System.out.println("Figura :" + c.nombre);

        // Constructor con parámetros 

        Perro p = new Perro("Perro", 2);
        System.out.println("Animal:" + p.especie + ", Edad: " + p.edad);

        //  Constructor sobrecargado 

        Informe i1 = new Informe();
        Informe i2 = new Informe("SRS");
        Informe i3 = new Informe("Requerimientos Funcionales", 20);

        System.out.println("Documento 1: " + i1.titulo + " Páginas: " + i1.paginas);
        System.out.println("Documento 2: " + i2.titulo + " Páginas: " + i2.paginas);
        System.out.println("Documento 3: " + i3.titulo + " Páginas: " + i3.paginas);

        //  Constructor copia

        Laptop l1 = new Laptop("ASUSVivobook", 3000000);
        Laptop l2 = new Laptop(l1);

        System.out.println("Laptop original " + l1.marca + " $" + l1.precio);
        System.out.println("Laptop copia  " + l2.marca + " $" + l2.precio);
    }
}
