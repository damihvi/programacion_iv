package com.example.basics

// Enum que representa tipos de buses
enum class TipoBus(val color: String, val capacidad: Int) {
    EXPRESS(color = "rojo", capacidad = 50) {
        override fun descripcion() = "Bus rápido, pocas paradas"
    },
    URBANO(color = "azul", capacidad = 40) {
        override fun descripcion() = "Bus regular de rutas urbanas"
    },
    INTERPROVINCIAL(color = "verde", capacidad = 60) {
        override fun descripcion() = "Bus de rutas largas entre ciudades"
    },
    ELECTRICO(color = "morado", capacidad = 35) {
        override fun descripcion() = "Bus ecológico con energía eléctrica"
    };

    abstract fun descripcion(): String

    companion object {
        fun porColor(color: String) = values().find { it.color == color }
    }
}

// Clase que representa un bus específico
class Bus(val tipo: TipoBus, val conductor: String) {
    fun arrancar() = "!brrr! El bus de color ${tipo.color} conducido por ${conductor} está en ruta"
    fun info() = "${tipo.descripcion()} - capacidad: ${tipo.capacidad} pasajeros"
}

fun main() {
    val bus1 = Bus(TipoBus.ELECTRICO, conductor = "Carlos Pérez")
    println(bus1)
    println(bus1.arrancar())
    println(bus1.info())

    val bus2 = Bus(TipoBus.URBANO, conductor = "Ana López")
    println(bus2)
    println(bus2.arrancar())
    println(bus2.info())
}
