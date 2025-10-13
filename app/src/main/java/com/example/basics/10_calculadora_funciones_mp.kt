package com.example.basics

// Funciones adaptadas al transporte público
fun calcularPasajeros(busA: Double, busB: Double): Double {
    return busA + busB
}

fun calcularDiferenciaPasajeros(busA: Double, busB: Double): Double {
    return busA - busB
}

fun calcularMultiplicacionPasajeros(busA: Double, busB: Double): Double {
    return busA * busB
}

fun calcularProporcionPasajeros(busA: Double, busB: Double): Double {
    return if (busB != 0.0) busA / busB else Double.NaN
}

fun main() {
    println("Calculadora")
    print("Ingresa el número de pasajeros del primer bus: ")
    val pasajerosA = readLine()!!.toDouble()

    print("Ingresa el número de pasajeros del segundo bus: ")
    val pasajerosB = readLine()!!.toDouble()

    println("Selecciona una operación: +, -, *, /")
    val operacionSeleccionada = readLine()!!

    val resultado = when (operacionSeleccionada) {
        "+" -> calcularPasajeros(pasajerosA, pasajerosB)
        "-" -> calcularDiferenciaPasajeros(pasajerosA, pasajerosB)
        "*" -> calcularMultiplicacionPasajeros(pasajerosA, pasajerosB)
        "/" -> calcularProporcionPasajeros(pasajerosA, pasajerosB)
        else -> {
            println("Operación no válida")
            return
        }
    }

    println("El resultado es: $resultado")
}
