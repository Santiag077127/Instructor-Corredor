package SinParametrosRetornado;

public class Saludo {
    String obtenerSaludo() {
        return "Hola Bienvenido al sistema.";
    }

    public static void main(String[] args) {
        Saludo s = new Saludo();
        String mensaje = s.obtenerSaludo();
        System.out.println(mensaje);
    }
}

