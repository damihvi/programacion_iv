package com.example.basics

fun main() {
    println("Sistema de Gestión de Transporte Público")

    val pasajerosBus1 = 40
    val pasajerosBus2 = 55

    if (pasajerosBus1 > pasajerosBus2) {
        println("El bus 1 lleva más pasajeros (${pasajerosBus1})")
    } else {
        println("El bus 2 lleva más pasajeros (${pasajerosBus2})")
    }

    println("Clasificación del bus segun su capacidad ocupada:")

    val capacidad = 60
    val ocupados = 45

    if (ocupados > 50) {
        println("El bus esta lleno")
    } else if (ocupados > 30) {
        println("El bus esta medio lleno")
    } else {
        println("El bus esta vacio")
    }
}
