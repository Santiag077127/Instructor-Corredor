package SinParametrosRetornado;

public class Sistema {
    boolean conexionActiva() {
        return true; 
    }

    public static void main(String[] args) {
        Sistema s = new Sistema();
        boolean estado = s.conexionActiva();
        System.out.println("¿Conexión activa?: " + estado);
    }
}

