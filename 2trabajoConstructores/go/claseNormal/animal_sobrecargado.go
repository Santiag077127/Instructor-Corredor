package main

import "fmt"

type AnimalSobrecargado struct {
	Nombre string
	Sonido string
}

func NuevoAnimalVacio() AnimalSobrecargado {
	return AnimalSobrecargado{}
}

func NuevoAnimalSoloNombre(nombre string) AnimalSobrecargado {
	return AnimalSobrecargado{Nombre: nombre}
}

func NuevoAnimalCompleto(nombre, sonido string) AnimalSobrecargado {
	return AnimalSobrecargado{Nombre: nombre, Sonido: sonido}
}

func (a AnimalSobrecargado) HacerSonido() {
	if a.Sonido == "" {
		fmt.Printf("%s no tiene sonido.\n", a.Nombre)
	} else {
		fmt.Printf("%s hace: %s\n", a.Nombre, a.Sonido)
	}
}
