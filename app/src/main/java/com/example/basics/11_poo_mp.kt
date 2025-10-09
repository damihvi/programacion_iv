package com.example.basics

data class Bus(
    val nombre: String,
    val capacidad: Int,
    val pasajerosActuales: Int,
    val conductor: String? = null
) {
    // Propiedad calculada: estado del bus según ocupación
    val estado: String
        get() = when {
            pasajerosActuales >= capacidad -> "completo"
            pasajerosActuales >= capacidad * 0.7 -> "casi lleno"
            pasajerosActuales >= capacidad * 0.4 -> "medio lleno"
            else -> "vacío"
        }

    // Función: puede salir a ruta
    fun puedeSalir(): Boolean = pasajerosActuales <= capacidad

    // Función: necesita mantenimiento
    fun requiereMantenimiento(): Boolean = pasajerosActuales > capacidad
}

fun main() {
    val bus1 = Bus(
        nombre = "Bus A",
        capacidad = 50,
        pasajerosActuales = 35,
        conductor = "Carlos Pérez"
    )
    println(bus1)

    // Desestructuración de un objeto
    val (nombreBus, capacidadBus, pasajerosBus) = bus1
    println("Nombre del bus: $nombreBus, Capacidad: $capacidadBus, Pasajeros: $pasajerosBus")

    // Copiar objetos
    val bus2 = bus1.copy(nombre = "Bus B", pasajerosActuales = 45)
    println(bus2)

    // Propiedades calculadas
    println("Estado de $bus2: ${bus2.estado}")
    println("¿$bus2 puede salir? ${bus2.puedeSalir()}")
}
