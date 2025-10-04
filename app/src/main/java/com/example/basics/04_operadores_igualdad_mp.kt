package com.example.basics

fun main() {
    println("Sistema de Gestión de Transporte Público")

    val ruta1: String = "Ruta 18"
    val ruta2: String = "Ruta 18"
    val ruta3: String = String("Ruta 18".toCharArray())

    println("Comparando rutas de buses:")

    println("Igualdad estructural (contenido):")
    println("ruta1 == ruta2 -> ${ruta1 == ruta2}")
    println("ruta1 == ruta3 -> ${ruta1 == ruta3}")

    println("Igualdad referencial (misma instancia):")
    println("ruta1 === ruta2 -> ${ruta1 === ruta2}")
    println("ruta1 === ruta3 -> ${ruta1 === ruta3}")
}
