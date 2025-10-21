class Silla {
    String material;
    boolean disponible;
    Silla(String m, boolean d) { material = m; disponible = d; }
    public void sentarse() { System.out.println("Te sientas en una silla de " + material); }
}
