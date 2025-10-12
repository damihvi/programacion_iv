package com.example.basics.tarea

fun main() {
    print("Ingrese un texto: ")
    val texto = readln()
    var contador = 0

    for (i in 0 until texto.length - 1) {
        val c1 = texto[i].lowercaseChar()
        val c2 = texto[i + 1].lowercaseChar()
        if (c1 in "aeiou" && c2 in "aeiou") contador++
    }

    println("Vocales consecutivas encontradas: $contador")
}
