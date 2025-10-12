package com.example.basics.tarea

fun main() {
    print("Distancia (km): ")
    val distancia = readln().toDouble()
    print("Llueve? (si/no): ")
    val lluvia = readln().lowercase()

    val base = when {
        distancia <= 5 -> 2.5
        distancia in 6.0..15.0 -> 5.0
        else -> 8.0
    }

    val costoTotal = if (lluvia == "si") base + 1.5 else base
    println("Costo total: $costoTotal")
}
