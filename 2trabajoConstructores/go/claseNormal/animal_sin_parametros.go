package main;

import "fmt"

type AnimalSinParametros struct {
	Nombre string
	Sonido string
}

func NuevoAnimalSinParametros() AnimalSinParametros {
	return AnimalSinParametros{
		Nombre: "Desconocido",
		Sonido: "Ninguno",
	}
}

func (a AnimalSinParametros) HacerSonido() {
	fmt.Printf("%s hace: %s\n", a.Nombre, a.Sonido)
}
