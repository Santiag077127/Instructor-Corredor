package atributos;

public class Coche {
    
    int velocidadMaxima = 180;

    public static void main(String[] args) {
        Coche carro = new Coche();
        System.out.println("Velocidad máxima: " + carro.velocidadMaxima + " km/h");
    }
}
