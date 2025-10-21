class Regla {
    int longitud;
    String material;
    Regla(int l, String m) { longitud = l; material = m; }
    public void medir() { System.out.println("Midiendo con regla de " + longitud + " cm."); }
}