package com.example.basics.tarea2

fun main() {
    println("Ingresa una contraseña: ")
    val pass = readLine() ?: ""

    val tieneNumero = pass.any { it.isDigit() }

    if (pass.length >= 8 && tieneNumero)
        println("Contraseña válida")
    else
        println("Contraseña inválida")
}
