package com.example.basics.tarea

fun main() {
    var totalDia = 0.0
    var clientes = 0

    while (true) {
        print("Ingrese total del cliente o 'fin': ")
        val entrada = readln()
        if (entrada.lowercase() == "fin") break

        val total = entrada.toDouble()
        print("Numero de items: ")
        val items = readln().toInt()

        var totalFinal = total
        if (total > 100) totalFinal *= 0.95
        if (items > 10) println("Caja rapida no disponible")

        println("Total a pagar: $totalFinal\n")

        totalDia += totalFinal
        clientes++
    }

    println("Total del dia: $totalDia")
    println("Clientes atendidos: $clientes")
}
