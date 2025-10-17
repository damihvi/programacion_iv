package com.example.basics.tarea2

fun main() {
    println("Color del semáforo (rojo, amarillo, verde): ")
    val color = readLine()?.lowercase() ?: ""
    println("¿Presionó el botón? (si/no): ")
    val boton = readLine()?.lowercase() ?: ""

    if (color == "verde" && boton == "si")
        println("Espera a rojo")
    else if (color == "rojo")
        println("Cruza")
    else if (color == "amarillo")
        println("Prepárate")
    else
        println("Espera")

}
