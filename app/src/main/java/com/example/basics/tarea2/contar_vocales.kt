package com.example.basics.tarea2

fun main() {
    println("Ingresa una palabra: ")
    val texto = readLine()?.lowercase() ?: ""
    var contador = 0

    for (c in texto) {
        if (c in "aeiou")
            contador++
    }

    println("Número de vocales: $contador")
}
