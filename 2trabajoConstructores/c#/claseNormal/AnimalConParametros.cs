public class AnimalConParametros
{
    public string Nombre { get; set; }
    public string Sonido { get; set; }

    public AnimalConParametros(string nombre, string sonido)
    {
        Nombre = nombre;
        Sonido = sonido;
    }

    public void HacerSonido()
    {
        Console.WriteLine($"{Nombre} hace: {Sonido}");
    }
}
