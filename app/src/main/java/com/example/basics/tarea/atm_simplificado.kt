package com.example.basics.tarea

fun main() {
    var saldo = 100.0
    var opcion: Int

    do {
        println(" menu")
        println("1. Depositar")
        println("2. Retirar")
        println("3. Salir")
        print("Opcion: ")
        opcion = readln().toInt()

        when (opcion) {
            1 -> {
                print("Monto a depositar: ")
                val monto = readln().toDouble()
                saldo += monto
            }
            2 -> {
                print("Monto a retirar: ")
                val monto = readln().toDouble()
                if (monto > saldo) {
                    println("Saldo insuficiente")
                } else saldo -= monto
            }
            3 -> println("Sesion terminada")
            else -> println("Opcion invalida")
        }
        println("Saldo actual: $saldo")
    } while (opcion != 3)
}
