package com.example.basics

fun main(){
    println("!operadores de igualdad!!!")
    val nombre1: String = "yoda"
    val nombre2: String = "yoda"
    val nombre3: String = String("yoda".toCharArray())

    println("igualdad estructural (contenido)")
    println(nombre1===nombre2)
    println(nombre1===nombre3)
    println("igualdad referencial (misma instancia)")
    println(nombre1===nombre2)
    println(nombre1===nombre3)



}