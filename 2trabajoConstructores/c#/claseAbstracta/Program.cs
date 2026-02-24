using System;

class Program
{
    static void Main()
    {
        Console.WriteLine("=== SIN PARÁMETROS ===");
        var a1 = new AnimalSinParametros();
        a1.HacerSonido();

        Console.WriteLine("\n=== CON PARÁMETROS ===");
        var a2 = new AnimalConParametros("Perro", "Guau");
        a2.HacerSonido();

        Console.WriteLine("\n=== SOBRECARGADO ===");
        var a3 = new AnimalSobrecargado("Gato", "Miau");
        a3.HacerSonido();

        Console.WriteLine("\n=== COPIA ===");
        var a4 = new AnimalCopia(a2);
        a4.HacerSonido();
    }
}
