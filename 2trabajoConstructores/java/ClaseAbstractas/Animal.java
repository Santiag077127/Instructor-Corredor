package ClaseAbstractas;

abstract class Animal {
    
    public String especie;
    public int edad;

    // Constructor con parámetros
    public Animal(String especie, int edad) {
        this.especie = especie;
        this.edad = edad;
    }
}
