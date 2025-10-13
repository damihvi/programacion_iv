package com.example.basics

fun main() {
    print("Ingrese el número de pasajeros por bus: ")
    val pasajeros = readLine()!!.toInt()

    println("Cálculo total de pasajeros en 10 buses:")
    for (i in 1..10) {
        println("Bus $i -> ${pasajeros * i} pasajeros en total")
    }
}
