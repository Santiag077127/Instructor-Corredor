package SinParametros;

public class Mensaje {
    void despedida() {
        System.out.println("¡Hasta pronto! Gracias por usar el programa.");
    }

    public static void main(String[] args) {
        Mensaje m = new Mensaje();
        m.despedida();
    }
}
