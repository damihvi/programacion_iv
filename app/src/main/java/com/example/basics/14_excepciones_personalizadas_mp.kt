package com.example.basics

class CapacidadInsuficienteException(message: String) : Exception(message)
class RutaPeligrosaException(message: String) : Exception(message)

fun realizarRuta(capacidadActual: Int, nivelPeligroRuta: Int): String {
    return try {
        when {
            capacidadActual < 10 -> throw CapacidadInsuficienteException("Capacidad demasiado baja: $capacidadActual pasajeros")
            capacidadActual < 40 -> throw RutaPeligrosaException("Ruta con pasajeros cercana al límite")
            else -> {
                "Ruta operativa sin problemas"
            }
        }
    } catch (e: CapacidadInsuficienteException) {
        "error: ${e.message}. Se requiere más personal o menos pasajeros"
    } catch (e: RutaPeligrosaException) {
        "error: ${e.message}. Nivel de peligro de la ruta: $nivelPeligroRuta"
    } catch (e: Exception) {
        "${e.message}"
    } finally {
        "Reporte de la ruta enviado"
    }
}

fun main() {
    println(realizarRuta(capacidadActual = 5, nivelPeligroRuta = 60))
    println(realizarRuta(capacidadActual = 50, nivelPeligroRuta = 60))
}
