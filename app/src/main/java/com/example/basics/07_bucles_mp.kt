package com.example.basics

fun main() {
    println("bucles")
    val buses = listOf("Bus A", "Bus B", "Bus C", "Bus D", "Bus E")
    for ((index, bus) in buses.withIndex()) {
        println("${index + 1}. $bus")
    }

    //rangos de paso
    for (i in 0..20 step 2) {
        println("combustible: $i%")
    }

    //rangos descendentes
    for (countdown in 10 downTo 1) {
        println("salida en: $countdown")
    }

    //control de flujo
    for (bus in buses) {
        if (bus == "Bus C") continue //saltar entre acción
        if (bus == "Bus D") break //detener el ciclo
        println("verificando mantenimiento de $bus")
    }
}
