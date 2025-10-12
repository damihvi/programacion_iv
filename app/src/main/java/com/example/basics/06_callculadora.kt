package com.example.basics

fun main(){
    println("!calculadora!!!")
    println("!Incluir el primer valor!!!")
    val value1: Int = readLine()?.toIntOrNull()?:0
    println("!Incluir el segundo valor!!!")
    val value2: Int = readLine()?.toIntOrNull()?:0
    println("suma : ${value1 + value2}")
    println("resta : ${value1 - value2}")
    println("multiplicacion : ${value1 * value2}")
    println("division : ${value1 / value2}")

}