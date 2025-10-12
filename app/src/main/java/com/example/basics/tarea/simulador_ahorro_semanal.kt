package com.example.basics.tarea

fun main() {
    print("Meta de ahorro: ")
    val meta = readln().toInt()
    print("Ahorro inicial: ")
    var ahorro = readln().toInt()

    var semana = 1
    var deposito = 5

    while (ahorro < meta) {
        ahorro += deposito
        println("Semana $semana: ahorro = $ahorro")
        deposito += 10
        semana++
    }

    println("Meta alcanzada con $ahorro en $semana semanas")
}
