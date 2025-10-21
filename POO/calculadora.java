class Calculadora {
    String marca;
    boolean encendida;
    Calculadora(String m, boolean e) { marca = m; encendida = e; }
    public void sumar(int a, int b) { System.out.println("Resultado: " + (a + b)); }
}
