package com.example.basics

fun main() {
    println("!operadores de control!!!")
    println("!condicionales!!!")
    val value1 = 10
    val value2 = 15
    if (value1>value2){
        println("el mayor es ${value1}" )
    } else {
        println("el mayor es ${value2}" )
    }

    println("rango segun el nivel de la fuerza" )
    var fuerza: Int = 10
    if (fuerza>10){
        println("Maestro" )
    } else if (fuerza > 5){
        println("caballero jedi")
    } else {
        println("padawan")
    }

    var tipodroide: String = "BB-8"
    when(tipodroide){
        "R2-D2", "R2-Q5"->println("Droide astromecanico")
        "C-3PO", "C-3PA"->println("Droide de protocolo")
        "BB-8", "BB-9E"->println("Droide de nueva generacion")
        else->print("Modelo Desconocido")
    }

    var peligro: Int = 5
    var recompensa: Int = 50
    when{
        peligro> 8 && recompensa <1000 ->("Mision rechazada")
        peligro<= 3 ->("Mision aceptada")
        else -> println("requiere evaluacion adicional")
    }


    var mes: Int = 7
    when (mes) {
        1, 2, 12 -> println("agua")
        3, 4, 5 -> println("fuego")
        6, 7, 8 -> println("tierra")
        9, 10, 11 -> println("aire")
        else -> println("ingrese de nuevo")
    }



}