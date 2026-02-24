public class AnimalConParametros : AnimalBase
{
    public AnimalConParametros(string nombre, string sonido)
    {
        Nombre = nombre;
        Sonido = sonido;
    }

    public override void HacerSonido()
    {
        Console.WriteLine($"{Nombre} hace: {Sonido}");
    }
}
