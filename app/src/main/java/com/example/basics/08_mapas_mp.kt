package com.example.transporte

fun main() {
    println("!Mapas!!!")
    val capacidadBuses = mapOf(
        "Bus A" to 40,
        "Bus B" to 35,
        "Bus C" to 50,
        "Bus D" to 60
    )
    println("capacidad de los buses : ${capacidadBuses}")

    println("mapa mutable")

    val rutasCompletadas = mutableMapOf<String, Int>()
    rutasCompletadas["Bus A"] = 10
    rutasCompletadas["Bus B"] = 12
    rutasCompletadas.put("Bus C", 8)

    println("rutas completadas: ${rutasCompletadas}")

    for ((bus, capacidad) in capacidadBuses) {
        println("$bus tiene capacidad de $capacidad pasajeros")
    }

    val rutasUrbanas = setOf("Centro", "Norte", "Sur")
    println("rutas urbanas: ${rutasUrbanas}")

    val rutasPeligrosas = setOf("Sur", "Industrial", "Periférica")
    println("rutas peligrosas: ${rutasPeligrosas}")

    println("operaciones de conjuntos")
    val interseccion = rutasPeligrosas intersect rutasUrbanas
    val union = rutasPeligrosas union rutasUrbanas
    val diferencia = rutasPeligrosas - rutasUrbanas

    println("rutas urbanas y peligrosas: ${interseccion}")
    println("todas las rutas: ${union}")
    println("rutas peligrosas no urbanas: ${diferencia}")

    print("Ingresa la hora (0-23): ")
    val hora = readLine()!!.toInt()

    if (hora in 7..13) {
        println("turno de la mañana")
    } else if (hora in 14..20) {
        println("turno de la tarde")
    } else {
        println("fuera de horario de servicio")
    }
}
