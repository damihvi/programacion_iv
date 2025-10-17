package com.example.basics.tarea2

fun main() {
    var suma = 0.0

    for (i in 1..3) {
        print("Ingresa la nota $i: ")
        val nota = readLine()?.toDoubleOrNull() ?: 0.0
        suma += nota
    }

    val promedio = suma / 3
    if (promedio >= 14)
        println("Aprobado con promedio $promedio")
    else
        println("Reprobado con promedio $promedio")
}
