package com.example.basics

fun iniciarSistema(){
    println("hola desde una funcion de kotlin")
}

fun calcularPasajeros(busA: Int, busB: Int): Int{
    return busA + busB
}

fun calcularTarifa(kilometros: Int) = kilometros * kilometros

fun resumenOperacion(viajesRealizados: Int, viajesCancelados: Int): Pair<Int,Int> {
    val total = viajesRealizados + viajesCancelados
    val diferencia = viajesRealizados - viajesCancelados
    return Pair(total, diferencia)
}

fun main(){
    iniciarSistema()
    val totalPasajeros = calcularPasajeros(busA = 12, busB = 8)
    println(totalPasajeros)
    println(calcularTarifa(6))
    println(resumenOperacion(20,5))
    val calcularCosto = {km: Int -> km * km}
    val mensajeConductor = {nombre: String -> "buenos dias, $nombre"}
    println(calcularTarifa(kilometros = 4))
    println(mensajeConductor("Carlos Pérez"))
}
