package com.example.basics

fun main(){
    println("!operadores logicos!!!")
    val edad: Int = 25
    val entrenamiento: Boolean = true
    val nivel: Int = 8

    val esApto = edad>= 18 && entrenamiento && nivel > 5
    val necesitaAyuda = !entrenamiento || nivel < 3
    println("es apto : ${esApto}")
    println("Necesita ayuda: ${necesitaAyuda}")




}
