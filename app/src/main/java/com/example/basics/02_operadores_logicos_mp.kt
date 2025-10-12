package com.example.basics

fun main() {
    println("Sistema de Gestión de Transporte Público")

    val combustible: Int = 60
    val enServicio: Boolean = true
    val revisionTecnica: Boolean = true

    val puedeSalir = combustible >= 50 && enServicio && revisionTecnica
    val necesitaMantenimiento = !revisionTecnica || combustible < 20

    println("¿El bus puede salir a ruta?: ${puedeSalir}")
    println("¿El bus necesita mantenimiento?: ${necesitaMantenimiento}")
}

