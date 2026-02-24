public class AnimalSinParametros : AnimalBase
{
    public AnimalSinParametros()
    {
        Nombre = "Desconocido";
        Sonido = "N/A";
    }

    public override void HacerSonido()
    {
        Console.WriteLine($"{Nombre} hace: {Sonido}");
    }
}
