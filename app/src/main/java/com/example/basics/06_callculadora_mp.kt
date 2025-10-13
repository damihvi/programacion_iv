package com.example.basics

fun main() {
    println("!Sistema de Gestión de Transporte!!!")
    println("!Ingrese la cantidad de pasajeros del primer bus")
    val bus1: Int = readLine()?.toIntOrNull() ?: 0
    println("!Ingrese la cantidad de pasajeros del segundo bus")
    val bus2: Int = readLine()?.toIntOrNull() ?: 0

    println("total de pasajeros : ${bus1 + bus2}")
    println("diferencia de pasajeros : ${bus1 - bus2}")
    println("multiplicacion comparativa : ${bus1 * bus2}")
    println("division : ${bus1 / bus2}")
}
