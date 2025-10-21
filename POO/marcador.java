class Marcador {
    String color;
    boolean tieneTinta;
    Marcador(String c, boolean t) { color = c; tieneTinta = t; }
    public void escribir() { System.out.println("Escribiendo con marcador " + color); }
}