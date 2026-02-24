package parametros;

public class Calculadora {
    void sumar(int a, int b) {
        System.out.println("La suma es: " + (a + b));
    }

    public static void main(String[] args) {
        Calculadora calc = new Calculadora();
        calc.sumar(5, 3);
    }
}

