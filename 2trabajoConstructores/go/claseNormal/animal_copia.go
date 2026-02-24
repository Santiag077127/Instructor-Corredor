package main

import "fmt"

type AnimalCopia struct {
	Nombre string
	Sonido string
}

func NuevoAnimalCopia(original AnimalConParametros) AnimalCopia {
	return AnimalCopia{
		Nombre: original.Nombre,
		Sonido: original.Sonido,
	}
}

func (a AnimalCopia) HacerSonido() {
	fmt.Printf("COPIA → %s hace: %s\n", a.Nombre, a.Sonido)
}
