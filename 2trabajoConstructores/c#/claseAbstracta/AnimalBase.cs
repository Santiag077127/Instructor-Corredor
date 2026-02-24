public abstract class AnimalBase
{
    public string Nombre { get; set; }
    public string Sonido { get; set; }

    public void MostrarDatos()
    {
        Console.WriteLine($"{Nombre} hace: {Sonido}");
    }

    public abstract void HacerSonido();
}
