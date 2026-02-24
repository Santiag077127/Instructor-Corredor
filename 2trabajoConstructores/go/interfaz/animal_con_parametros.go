package main

import "fmt"

type AnimalConParametros struct {
	Nombre string
	Sonido string
}

func NuevoAnimalConParametros(nombre, sonido string) AnimalConParametros {
	return AnimalConParametros{
		Nombre: nombre,
		Sonido: sonido,
	}
}

func (a AnimalConParametros) HacerSonido() {
	fmt.Printf("%s hace: %s\n", a.Nombre, a.Sonido)
}
