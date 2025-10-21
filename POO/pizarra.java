class Pizarra {
    String tipo;
    boolean limpia;
    Pizarra(String t, boolean l) { tipo = t; limpia = l; }
    public void escribir(String texto) { System.out.println("Escribiendo en la pizarra: " + texto); }
}