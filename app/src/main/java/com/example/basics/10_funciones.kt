package com.example.basics

fun saludar(){
    println("hola desde una funcion de kotlin")
}

fun sumar(a: Int, b: Int): Int{
    return a + b
}

fun cuadrado(numero: Int) = numero * numero

fun retornomultiple(a: Int, b: Int): Pair<Int,Int> {
    val suma = a+b
    val resta = a-b
    return Pair(suma, resta)
}


fun main(){
    saludar()
    val resultado = sumar(a=5,b=6)
    println(resultado)
    println(cuadrado(6))
    println(retornomultiple(15,5))
    val cuadradolambda = {x: Int-> x*x}
    val saludolambda = {nombre: String-> "buenos dias, $nombre"}
    println(cuadrado(numero = 4))
    println(saludolambda("juan luis guerra"))
}


