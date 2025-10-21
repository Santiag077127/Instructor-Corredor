class Cuaderno {
    int hojas;
    String color;
    Cuaderno(int h, String c) { hojas = h; color = c; }
    public void escribir() { System.out.println("Escribiendo en cuaderno " + color); }
}