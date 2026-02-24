package ClaseAbstractas;

abstract class Documento {

    public String titulo;
    public int paginas;

    //Constructor sobrecargado
    public Documento() {
        this.titulo = "Documento Vacio";
        this.paginas = 1;
    }

    public Documento(String titulo) {
        this.titulo = titulo;
        this.paginas = 1;
    }

    public Documento(String titulo, int paginas) {
        this.titulo = titulo;
        this.paginas = paginas;
    }
}

