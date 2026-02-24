package atributos;

public class Computador {
    
    boolean encendido = true;

    public static void main(String[] args) {
        Computador pc = new Computador();
        System.out.println("¿Está encendido?: " + pc.encendido);
    }
}

