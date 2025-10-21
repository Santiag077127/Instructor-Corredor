class Libro {
    String titulo;
    String autor;
    Libro(String t, String a) { titulo = t; autor = a; }
    public void leer() { System.out.println("Leyendo: " + titulo); }
}