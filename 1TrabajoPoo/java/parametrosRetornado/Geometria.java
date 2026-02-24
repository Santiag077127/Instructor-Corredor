package parametrosRetornado;

public class Geometria {
    double areaRectangulo(double base, double altura) {
        return base * altura;
    }

    public static void main(String[] args) {
        Geometria g = new Geometria();
        double area = g.areaRectangulo(5.0, 3.0);
        System.out.println("El área del rectángulo es: " + area);
    }
}
