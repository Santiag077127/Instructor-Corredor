package SinParametrosRetornado;

public class Aleatorio {
    double generarNumero() {
        return Math.random(); 
    }

    public static void main(String[] args) {
        Aleatorio a = new Aleatorio();
        double numero = a.generarNumero();
        System.out.println("Número aleatorio: " + numero);
    }
}

