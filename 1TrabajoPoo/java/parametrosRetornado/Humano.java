package parametrosRetornado;

public class Humano {
    boolean esMayorDeEdad(int edad) {
        return edad >= 18;
    }

    public static void main(String[] args) {
        Humano p = new Humano();
        boolean mayor = p.esMayorDeEdad(20);
        System.out.println("¿Es mayor de edad?: " + mayor);
    }
}
