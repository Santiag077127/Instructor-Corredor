package interfaz;

class Archivo implements IDocumento {
    
    public String nombre;
    public int tamaño;

    public Archivo() {
        this.nombre = "Archivo vacío";
        this.tamaño = 1;
    }

    public Archivo(String nombre) {
        this.nombre = nombre;
        this.tamaño = 10;
    }

    public Archivo(String nombre, int tamaño) {
        this.nombre = nombre;
        this.tamaño = tamaño;
    }
}
