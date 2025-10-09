package com.example.transporte

fun main() {
    println("!listas!!!")
    val busesInmutables: List<Int> = listOf(101, 102, 103)
    println("lista inmutable: ${busesInmutables}")

    val busesMutables: MutableList<Int> = mutableListOf(201, 202, 203)
    println("lista mutable ${busesMutables}")

    val listaBuses: MutableList<Int> = mutableListOf(201, 202, 203)
    println("lista mutable ${busesMutables}")
    busesMutables.add(204)
    println("lista mutable ${busesMutables}")
    busesMutables.removeAt(index = 0)
    println("lista mutable ${busesMutables}")

    for (bus in busesMutables) println(bus)

    println("operaciones con mutable list")

    val rutas = mutableListOf("Centro", "Norte")
    rutas.add("Sur")
    rutas += "Valle"
    rutas.add(1, "Industrial")
    println("rutas")
    rutas.remove("Norte")
    println(rutas)
    rutas.removeAt(0)
    println(rutas)
    rutas[0] = "Terminal"
    println(rutas)
    rutas.clear()
    println(rutas.isEmpty())

    println("busquedas con mutable list")
    val conductores = mutableListOf("Carlos", "Luis", "Pedro")
    println(conductores.find { it.startsWith(prefix = "L") })
    println(conductores.firstOrNull { it.length > 4 })
    println(conductores.any { it.contains(char = 'r') })
    println(conductores.none { it == "X" })

    println("ordenamiento con mutable list")
    val pasajerosDesordenados = mutableListOf(80, 30, 20, 40, 10, 60)
    println(pasajerosDesordenados.sorted())
    println(pasajerosDesordenados.sortedDescending())
    println(pasajerosDesordenados.distinct())
}
