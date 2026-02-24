public class AnimalSinParametros
{
    public string Nombre { get; set; }
    public string Sonido { get; set; }

    public AnimalSinParametros()
    {
        Nombre = "Animal genérico";
        Sonido = "Sonido desconocido";
    }

    public void HacerSonido()
    {
        Console.WriteLine($"{Nombre} hace: {Sonido}");
    }
}
