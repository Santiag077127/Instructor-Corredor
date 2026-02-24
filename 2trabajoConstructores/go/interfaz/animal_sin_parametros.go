package main

import "fmt"

type AnimalSinParametros struct {
	Nombre string
	Sonido string
}

// "Constructor"
func NuevoAnimalSinParametros() AnimalSinParametros {
	return AnimalSinParametros{
		Nombre: "Desconocido",
		Sonido: "Ninguno",
	}
}

// Implementa la interfaz IAnimal
func (a AnimalSinParametros) HacerSonido() {
	fmt.Printf("%s hace: %s\n", a.Nombre, a.Sonido)
}
