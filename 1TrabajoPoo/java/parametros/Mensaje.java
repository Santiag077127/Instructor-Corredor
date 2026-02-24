package parametros;

public class Mensaje {
    
    void mostrarMensaje(String destinatario, String texto) {
        System.out.println("Mensaje para " + destinatario + ": " + texto);
    }

    public static void main(String[] args) {
        Mensaje m = new Mensaje();
        m.mostrarMensaje("Carlos", "No olvides la reunión a las 10.");
    }
}
