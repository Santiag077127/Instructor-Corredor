package parametros;

public class Persona {
    
    void saludar(String nombre) {
        System.out.println("Hola " + nombre + ", bienvenido al programa.");
    }

    public static void main(String[] args) {
        Persona p1 = new Persona();
        p1.saludar("Santiago");
    }
}
