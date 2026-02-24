package atributos;

public class Estudiante {
    String nombre = "Laura";
    int edad = 20;
    double promedio = 4.5;

    public static void main(String[] args) {
        Estudiante e = new Estudiante();
        System.out.println("Nombre: " + e.nombre);
        System.out.println("Edad: " + e.edad);
        System.out.println("Promedio: " + e.promedio);
    }
}

