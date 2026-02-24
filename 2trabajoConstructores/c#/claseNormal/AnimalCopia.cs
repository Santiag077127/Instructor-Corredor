public class AnimalCopia
{
    public string Nombre { get; set; }
    public string Sonido { get; set; }

    public AnimalCopia(string nombre, string sonido)
    {
        Nombre = nombre;
        Sonido = sonido;
    }

    // Constructor copia
    public AnimalCopia(AnimalConParametros original)
    {
        Nombre = original.Nombre;
        Sonido = original.Sonido;
    }

    public void HacerSonido()
    {
        Console.WriteLine($"{Nombre} hace: {Sonido}");
    }
}
