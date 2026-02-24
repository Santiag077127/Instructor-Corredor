package ClaseNormal;

public class Vehiculo {
    
    public String marca;
    public int modelo;

    //constructor DE COPIA
    public Vehiculo(String marca, int modelo) {
        this.marca = marca;
        this.modelo = modelo;
    }

    public Vehiculo(Vehiculo otro) {
        this.marca = otro.marca;
        this.modelo = otro.modelo;
    }
}

