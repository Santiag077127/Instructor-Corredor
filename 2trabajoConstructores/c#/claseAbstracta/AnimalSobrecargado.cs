public class AnimalSobrecargado : AnimalBase
{
    public AnimalSobrecargado(string nombre)
    {
        Nombre = nombre;
        Sonido = "N/A";
    }

    public AnimalSobrecargado(string nombre, string sonido)
    {
        Nombre = nombre;
        Sonido = sonido;
    }

    public override void HacerSonido()
    {
        Console.WriteLine($"{Nombre} hace: {Sonido}");
    }
}
