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
        Silla s1 = new Silla("Plástico", true);
        s1.sentarse();

        // 5. Pizarra
        Pizarra piz1 = new Pizarra("Acrílica", true);
        piz1.escribir("Bienvenidos al salón");

        // 6. Marcador
        Marcador m1 = new Marcador("Negro", true);
        m1.escribir();

        // 7. Borrador
        Borrador b1 = new Borrador("Espuma", true);
        b1.borrar();

        // 9. Proyector
        Proyector pr1 = new Proyector("Epson", true);
        pr1.proyectar();

        // 10. Ventana
        Ventana v1 = new Ventana("Grande", false);
        v1.abrir();

        // 11. Puerta
        Puerta pt1 = new Puerta("Madera", false);
        pt1.cerrar();

        // 12. Libro
        Libro l1 = new Libro("Java Básico", "Deitel");
        l1.leer();

        // 13. Cuaderno
        Cuaderno cu1 = new Cuaderno(100, "Rojo");
        cu1.escribir();

        // 14. Lámpara
        Lampara la1 = new Lampara("LED", false);
        la1.encender();

        // 15. Reloj
        Reloj r1 = new Reloj("Digital", "08:00");
        r1.mostrarHora();

        // 16. Ventilador
        Ventilador v2 = new Ventilador("Oster", 3);
        v2.encender();

        // 17. Basurero
        Basurero bas1 = new Basurero("Grande", 0);
        bas1.vaciar();

        // 18. Cartel
        Cartel ca1 = new Cartel("Reglamento del aula", "Papelería");
        ca1.mostrar();

        // 19. Bandera
        Bandera ba1 = new Bandera("Colombia", "Tela");
        ba1.mostrar();

        // 20. Mochila
        Mochila mo1 = new Mochila("Azul", 5);
        mo1.abrir();

        // 21. Regla
        Regla re1 = new Regla(30, "Plástico");
        re1.medir();

        // 22. Calculadora
        Calculadora cal1 = new Calculadora("Casio", true);
        cal1.sumar(5, 8);

        // 23. Tiza
        Tiza ti1 = new Tiza("Blanca", 10);
        ti1.usar();

        // 24. Estuche
        Estuche es1 = new Estuche("Negro", 10);
        es1.abrir();

        // 25. Parlante
        Parlante pa1 = new Parlante("Sony", true);
        pa1.reproducirSonido();

        // 26. Televisor
        Televisor tv1 = new Televisor("Samsung", 42);
        tv1.encender();

        // 27. Cortina
        Cortina co1 = new Cortina("Azul", false);
        co1.correr();

        // 28. Piso
        Piso pi1 = new Piso("Cerámica", "Beige");
        pi1.limpiar();

        // 29. Techo
        Techo te1 = new Techo("Blanco", true);
        te1.revisar();

        // 30. AireAcondicionado
        AireAcondicionado ai1 = new AireAcondicionado("LG", 22);
        ai1.regularTemperatura();
    }
}