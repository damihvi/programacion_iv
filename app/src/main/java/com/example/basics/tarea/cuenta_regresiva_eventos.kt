package com.example.basics.tarea

fun main() {
    for (i in 30 downTo 0) {
        when (i) {
            20 -> println("20 = Chequeo de sistemas")
            10 -> println("10 = Últimos ajustes")
            0 -> println("0 = Despegue")
            else -> println(i)
        }
    }
}
