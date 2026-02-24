package main

import "fmt"

func main() {
	fmt.Println("=== SIN PARÁMETROS ===")
	a1 := NuevoAnimalSinParametros()
	a1.HacerSonido()

	fmt.Println("\n=== CON PARÁMETROS ===")
	a2 := NuevoAnimalConParametros("Perro", "Guau")
	a2.HacerSonido()

	fmt.Println("\n=== SOBRECARGADO ===")
	s1 := NuevoAnimalVacio()
	s1.HacerSonido()

	s2 := NuevoAnimalSoloNombre("Gato")
	s2.HacerSonido()

	s3 := NuevoAnimalCompleto("Vaca", "Muuu")
	s3.HacerSonido()

	fmt.Println("\n=== COPIA ===")
	copia := NuevoAnimalCopia(a2)
	copia.HacerSonido()
}
