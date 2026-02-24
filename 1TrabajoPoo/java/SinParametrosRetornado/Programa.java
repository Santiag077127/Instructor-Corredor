package SinParametrosRetornado;

public class Programa {
    String obtenerNombre() {
        return "Sistema de Gestión Empresarial";
    }

    public static void main(String[] args) {
        Programa p = new Programa();
        String nombre = p.obtenerNombre();
        System.out.println("Nombre del programa: " + nombre);
    }
}
