package parametrosRetornado;

public class Persona {
    String nombreCompleto(String nombre, String apellido) {
        return nombre + " " + apellido;
    }

    public static void main(String[] args) {
        Persona p1 = new Persona();
        String completo = p1.nombreCompleto("Santiago", "Pérez");
        System.out.println("Nombre completo: " + completo);
    }
}
