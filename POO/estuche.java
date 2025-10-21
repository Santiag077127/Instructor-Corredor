class Estuche {
    String color;
    int capacidad;
    Estuche(String c, int cap) { color = c; capacidad = cap; }
    public void abrir() { System.out.println("Abriendo estuche " + color); }
}