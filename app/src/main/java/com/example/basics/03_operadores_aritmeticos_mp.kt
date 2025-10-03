package com.example.basics

fun main() {
    println("=== Sistema de Gestión de Transporte Público ===")

    val tarifa = 0.35
    val pasajeros = 50
    val buses = 3

    val ingresoPorBus = tarifa * pasajeros
    val ingresoTotal = ingresoPorBus * buses

    println("Tarifa por pasajero: $$tarifa")
    println("Pasajeros por bus: $pasajeros")
    println("Número de buses: $buses")
    println("Ingreso por bus: $$ingresoPorBus")
    println("Ingreso total del sistema: $$ingresoTotal")
}