package com.example.basics.tarea2

fun main() {
    println("Ingresa un numero: ")
    val num = readLine()?.toIntOrNull() ?: 0

    println("Tabla del $num:")
    for (i in 1..10)
        println("$num x $i = ${num * i}")
}
