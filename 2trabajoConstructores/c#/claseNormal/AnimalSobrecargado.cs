public class AnimalSobrecargado
{
    public string Nombre { get; set; }
    public string Sonido { get; set; }

    public AnimalSobrecargado(string nombre)
    {
        Nombre = nombre;
        Sonido = "MIAU";
    }

    public AnimalSobrecargado(string nombre, string sonido)
    {
        Nombre = nombre;
        Sonido = sonido;
    }

    public void HacerSonido()
    {
        Console.WriteLine($"{Nombre} hace: {Sonido}");
    }
}
