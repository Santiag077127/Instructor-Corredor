class Program
{
    static void Main(string[] args)
    {
        // 1. Constructor sin parámetros
        Perro p1 = new Perro();
        p1.HacerSonido();

        // 2. Constructor con parámetros
        Perro p2 = new Perro("Rocky", "Pitbull");
        p2.HacerSonido();

        // 3. Constructor sobrecargado
        Perro p3 = new Perro("Bobby");
        p3.HacerSonido();

        // 4. Constructor de copia
        Perro p4 = new Perro(p2);
        p4.HacerSonido();
    }
}
