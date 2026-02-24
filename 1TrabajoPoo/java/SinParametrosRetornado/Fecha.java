package SinParametrosRetornado;

import java.time.Year;

public class Fecha {
    int obtenerAnioActual() {
        return Year.now().getValue();
    }

    public static void main(String[] args) {
        Fecha f = new Fecha();
        int anio = f.obtenerAnioActual();
        System.out.println("Año actual: " + anio);
    }
}
