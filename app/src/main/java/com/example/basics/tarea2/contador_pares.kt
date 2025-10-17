package com.example.basics.tarea2

fun main() {
    println("Ingresa un número N: ")
    val n = readLine()?.toIntOrNull() ?: 0
    var contador = 0

    for (i in 1..n) {
        if (i % 2 == 0)
            contador++
    }

    println("Hay $contador números pares entre 1 y $n")
}