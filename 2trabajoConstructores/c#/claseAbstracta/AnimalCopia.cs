public class AnimalCopia : AnimalBase
{
    public AnimalCopia(AnimalBase otro)
    {
        Nombre = otro.Nombre;
        Sonido = otro.Sonido;
    }

    public override void HacerSonido()
    {
        Console.WriteLine($"{Nombre} hace: {Sonido}");
    }
}
