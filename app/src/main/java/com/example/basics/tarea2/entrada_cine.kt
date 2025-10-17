package com.example.basics.tarea2

fun main() {
    println("Ingresa tu edad: ")
    val edad = readLine()?.toIntOrNull() ?: 0
    var precio = 5

    if (edad < 12)
        precio = 3
    else if (edad >= 65)
        precio = 4

    println("El precio de la entrada es: $$precio")
}
