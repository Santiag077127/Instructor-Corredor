class Pupitre {
    String material;
    boolean limpio;
    Pupitre(String m, boolean l) { material = m; limpio = l; }
    public void usar() { System.out.println("Pupitre de " + material + " en uso."); }
}