public class main {
    public static void main(String[] args) {
        // 1. Estudiante
        celular celular1 = new celular("Infinix","Rojo");
        celular1.llamar();

        // 2. lapiz
        lapiz lapiz = new lapiz("Paper mater", "Rojo");
        lapiz.escribir();

        // 3. Pupitre
        portatil portatil = new portatil("ASUS", "GRIS");
        portatil.prender();

        // 4. Silla
        Silla silla = new Silla("Plástico", true);
        silla.sentarse();

        // 5. Pizarra
        Pizarra pizarra = new Pizarra("Acrílica", true);
        pizarra.escribir("Bienvenidos al salón");

        // 6. Marcador
        Marcador marcador = new Marcador("Negro", true);
        marcador.escribir();

        // 7. Borrador
        Borrador borrador = new Borrador("Espuma", true);
        borrador.borrar();

        // 9. Proyector
        Proyector proyector = new Proyector("Epson", true);
        proyector.proyectar();

        // 10. Ventana
        Ventana ventana = new Ventana("Grande", false);
        ventana.abrir();

        // 11. Puerta
        Puerta puerta = new Puerta("Madera", false);
        puerta.cerrar();

        // 12. Libro
        Libro libro = new Libro("Java Básico", "Deitel");
        libro.leer();

        // 13. Cuaderno
        Cuaderno cuaderno = new Cuaderno(100, "Rojo");
        cuaderno.escribir();

        // 14. Lámpara
        Lampara lampara = new Lampara("LED", false);
        lampara.encender();

        // 15. Reloj
        Reloj reloj = new Reloj("Digital", "08:00");
        reloj.mostrarHora();

        // 16. Ventilador
        Ventilador ventilador = new Ventilador("Oster", 3);
        ventilador.encender();

        // 17. Basurero
        Basurero basurero = new Basurero("Grande", 0);
        basurero.vaciar();

        // 18. Cartel
        Cartel cartel = new Cartel("Reglamento del aula", "Papelería");
        cartel.mostrar();

        // 19. Bandera
        Bandera bandera = new Bandera("Colombia", "Tela");
        bandera.mostrar();

        // 20. Mochila
        Mochila mochila = new Mochila("Azul", 5);
        mochila.abrir();

        // 21. Regla
        Regla regla = new Regla(30, "Plástico");
        regla.medir();

        // 22. Calculadora
        Calculadora calculadora = new Calculadora("Casio", true);
        calculadora.sumar(5, 8);

        // 23. Tiza
        Tiza tiza = new Tiza("Blanca", 10);
        tiza.usar();

        // 24. Estuche
        Estuche estuche = new Estuche("Negro", 10);
        estuche.abrir();

        // 25. Parlante
        Parlante parlante = new Parlante("Sony", true);
        parlante.reproducirSonido();

        // 26. Televisor
        Televisor tv1 = new Televisor("Samsung", 42);
        tv1.encender();

        // 27. Cortina
        Cortina cortina = new Cortina("Azul", false);
        cortina.correr();

        // 28. Piso
        Piso piso = new Piso("Cerámica", "Beige");
        piso.limpiar();

        // 29. Techo
        Techo techo = new Techo("Blanco", true);
        techo.revisar();

        // 30. AireAcondicionado
        AireAcondicionado ai1 = new AireAcondicionado("LG", 22);
        ai1.regularTemperatura();
    }
}