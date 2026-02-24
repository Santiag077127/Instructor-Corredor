public class Perro : IAnimal
{
    public string Nombre { get; set; }
    public string Raza { get; set; }

    // 1. Constructor sin parámetros
    public Perro()
    {
        Nombre = "Sin nombre";
        Raza = "Desconocida";
    }

    // 2. Constructor con parámetros
    public Perro(string nombre, string raza)
    {
        Nombre = nombre;
        Raza = raza;
    }

    // 3. Constructor sobrecargado 
    public Perro(string nombre)
    {
        Nombre = nombre;
        Raza = "Desconocida";
    }

    // 4. Constructor de copia
    public Perro(Perro original)
    {
        Nombre = original.Nombre;
        Raza = original.Raza;
    }

    public void HacerSonido()
    {
        Console.WriteLine($"{Nombre} ({Raza}) dice: ¡Guau!");
    }
}
