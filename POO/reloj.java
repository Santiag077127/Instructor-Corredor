class Reloj {
    String tipo;
    String hora;
    Reloj(String t, String h) { tipo = t; hora = h; }
    public void mostrarHora() { System.out.println("Hora actual: " + hora); }
}