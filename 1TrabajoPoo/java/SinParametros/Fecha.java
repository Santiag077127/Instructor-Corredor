package SinParametros;

import java.time.LocalDate;

public class Fecha {
    void mostrarFechaActual() {
        LocalDate hoy = LocalDate.now();
        System.out.println("La fecha actual es: " + hoy);
    }

    public static void main(String[] args) {
        Fecha f = new Fecha();
        f.mostrarFechaActual();
    }
}

