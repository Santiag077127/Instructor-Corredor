using System;

class Program
{
    static void Main()
    {
        Console.WriteLine("SIN PARÁMETROS:");
        var a1 = new AnimalSinParametros();
        a1.HacerSonido();

        Console.WriteLine(" CON PARÁMETROS:");
        var a2 = new AnimalConParametros("Perro", "Guau");
        a2.HacerSonido();

        Console.WriteLine(" SOBRECARGADO:");
        var a3 = new AnimalSobrecargado("Gato");
        a3.HacerSonido();

        Console.WriteLine(" COPIA:");
        var a4 = new AnimalCopia(a2);
        a4.HacerSonido();
    }
}
