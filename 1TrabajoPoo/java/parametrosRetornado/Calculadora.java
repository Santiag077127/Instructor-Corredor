package parametrosRetornado;

public class Calculadora {
    int sumar(int a, int b) {
        return a + b;
    }

    public static void main(String[] args) {
        Calculadora calc = new Calculadora();
        int resultado = calc.sumar(5, 3);
        System.out.println("La suma es: " + resultado);
    }
}
