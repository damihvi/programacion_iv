package com.example.basics.tarea2

fun main() {
    println("Ingresa la temperatura en °C: ")
    val temp = readLine()?.toIntOrNull() ?: 0

    if (temp <= 0)
        println("Sólido")
    else if (temp in 1..99)
        println("Líquido")
    else
        println("Gas")
}

