package com.example.basics.tarea2

fun main() {
    println("Ingresa un número N: ")
    val n = readLine()?.toIntOrNull() ?: 0
    var suma = 0

    for (i in 1..n) {
        if (i % 3 == 0)
            suma += i
    }

    println("La suma de múltiplos de 3 hasta $n es: $suma")
}
