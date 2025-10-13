package com.example.basics

fun main(){
    print("Ingrese un numero: ")
    val numero = readLine()!!.toInt()

    println("Tabla del $numero:")
    for (i in 1..10) {
        println("$numero x $i = ${numero * i}")
    }



    print("Ingresa tu promedio: ")
    val promedio = readLine()!!.toDouble()

    print("Trabajas? (si / no): ")
    val trabaja = readLine()!!.lowercase()

    if (promedio >= 90 && trabaja == "no") {
        println("Beca completa")
    } else if (promedio >= 90 && trabaja == "si") {
        println("Beca parcial")
    } else if (promedio < 90) {
        println("Sin beca")
    } else {
        println("Datos inválidos")
    }
}
