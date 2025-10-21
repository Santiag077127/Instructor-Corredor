class AireAcondicionado {
    String marca;
    int temperatura;
    AireAcondicionado(String m, int t) { marca = m; temperatura = t; }
    public void regularTemperatura() { System.out.println("Temperatura ajustada a " + temperatura + "°C"); }
}