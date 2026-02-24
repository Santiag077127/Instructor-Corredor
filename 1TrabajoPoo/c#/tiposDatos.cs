using System;

class TiposDatos
{
    static void Main()
    {
        // 🔹 Enteros
        int edad = 25;
        int año = 2025;
        Console.WriteLine($"Edad: {edad}, Año: {año}");

        // 🔹 Decimales
        double altura = 1.75;
        double peso = 68.5;
        Console.WriteLine($"Altura: {altura}, Peso: {peso}");

        // 🔹 Carácter
        char inicial = 'S';
        Console.WriteLine($"Inicial del nombre: {inicial}");

        // 🔹 Booleanos
        bool activo = true;
        bool estudiante = false;
        Console.WriteLine($"¿Activo?: {activo}, ¿Estudiante?: {estudiante}");

        // 🔹 Texto
        string nombre = "Santiago";
        string ciudad = "Bogotá";
        Console.WriteLine($"Nombre: {nombre}, Ciudad: {ciudad}");

        // 🔹 Arreglos
        string[] frutas = { "Manzana", "Pera", "Banano" };
        Console.WriteLine($"Primera fruta: {frutas[0]}");
    }
}
