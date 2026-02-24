package main

import "fmt"

func main() {

	fmt.Println("=== INTERFAZ EN GO ===")

	// Declaraciones usando la interfaz
	var animal IAnimal

	fmt.Println("\n=== SIN PARÁMETROS ===")
	animal = NuevoAnimalSinParametros()
	animal.HacerSonido()

	fmt.Println("\n=== CON PARÁMETROS ===")
	animal = NuevoAnimalConParametros("Perro", "Guau")
	animal.HacerSonido()

	fmt.Println("\n=== SOBRECARGADO ===")
	animal = NuevoAnimalVacio()
	animal.HacerSonido()

	animal = NuevoAnimalSoloNombre("Gato")
	animal.HacerSonido()

	animal = NuevoAnimalCompleto("Vaca", "Muuu")
	animal.HacerSonido()

	fmt.Println("\n=== COPIA ===")
	original := NuevoAnimalConParametros("Loro", "Hola")
	copia := NuevoAnimalCopia(original)
	copia.HacerSonido()
}
