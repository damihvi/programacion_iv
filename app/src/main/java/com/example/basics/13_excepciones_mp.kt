package com.example.basics

fun main() {
    try {
        // Ejemplo: calcular pasajeros por bus, evitando división por cero
        val pasajerosBusA = 50
        val pasajerosBusB = 0
        val promedioPasajeros = pasajerosBusA / pasajerosBusB
        println("Promedio de pasajeros: $promedioPasajeros")
    } catch (e: Exception) {
        println(e)
        println("Error al calcular el promedio de pasajeros")
    }
}