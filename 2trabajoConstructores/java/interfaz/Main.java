package interfaz;

public class Main {
    public static void main(String[] args) {

        //  Sin parámetros 
        Circulo c = new Circulo();
        System.out.println("Figura  " + c.nombre);

        //  Con parámetros 
        Perro p = new Perro("Pastor Alemán", 5);
        System.out.println("Animal  " + p.raza + ", Edad: " + p.edad);

        //  Constructores sobrecargados ----
        Archivo a1 = new Archivo();
        Archivo a2 = new Archivo("Informe");
        Archivo a3 = new Archivo("Manual", 120);

        System.out.println("Archivo1  " + a1.nombre + " Tamaño: " + a1.tamaño);
        System.out.println("Archivo2  " + a2.nombre + " Tamaño: " + a2.tamaño);
        System.out.println("Archivo3  " + a3.nombre + " Tamaño: " + a3.tamaño);

        //  Constructor copia 
        Celular ce1 = new Celular("Samsung", 250000.0);
        Celular ce2 = new Celular(ce1);

        System.out.println("Celular Original -> " + ce1.marca + " $" + ce1.precio);
        System.out.println("Celular Copia  " + ce2.marca + " $" + ce2.precio);
    }
}
