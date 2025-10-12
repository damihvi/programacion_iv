package com.example.basics.tarea

import kotlin.random.Random

fun main() {
    print("Numero de etapas: ")
    val etapas = readln().toInt()

    var energia = 100
    for (i in 1..etapas) {
        val terreno = Random.nextInt(1, 4)
        val gasto = when (terreno) {
            1 -> 5   // Asfalto
            2 -> 10  // Tierra
            else -> 15 // Barro
        }
        energia -= gasto
        println("Etapa $i: terreno $terreno → energia restante $energia")

        if (energia <= 0) {
            println("Abandona en etapa $i")
            return
        }
    }

    println("Rally completado con energia $energia")
}
