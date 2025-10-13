package com.example.transporte

fun main() {
    println("Sistema de Gestión de Transporte")
    println("Ingrese la cantidad de pasajeros del primer bus:")
    val bus1: Int = readLine()?.toIntOrNull() ?: 0
    println("Ingrese la cantidad de pasajeros del segundo bus:")
    val bus2: Int = readLine()?.toIntOrNull() ?: 0
    println("Seleccione una operación:")
    println("1 Total pasajeros, 2 Diferencia, 3 Multiplicación, 4 Promedio")
    val opcion: Int = readLine()?.toIntOrNull() ?: 0

    when (opcion) {
        1 -> println("Total de pasajeros: ${bus1 + bus2}")
        2 -> println("Diferencia de pasajeros: ${bus1 - bus2}")
        3 -> println("Multiplicación: ${bus1 * bus2}")
        4 -> if (bus2 != 0) {
            println("Promedio de pasajeros: ${(bus1 + bus2) / 2}")
        } else {
            println("No se puede calcular el promedio")
        }
        else -> println("Opción no válida")
    }
}
