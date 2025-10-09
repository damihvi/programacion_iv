package com.example.basics
class fuerzainsuficienteexception(message: String) : Exception(message)
class misionpeligrosaexception(message: String) : Exception(message)

fun realizarmision(nivelfuerza:Int,peligromision:Int): String {

    return try {
        when {
            nivelfuerza < 30 -> throw fuerzainsuficienteexception("nivel de fuerza muy bajo:${nivelfuerza}")
            nivelfuerza < 80 -> throw misionpeligrosaexception("mision extremadamente peligrosa")
            else -> {
                "error inesperado"
            }
        }
    } catch (e: fuerzainsuficienteexception) {
        "error: ${e.message}. se requiere entrenamiento adicional"
    } catch (e: misionpeligrosaexception) {
        "error: ${e.message}. nivel de peligro ${peligromision}"
    } catch (e: Exception) {
        "${e.message}"
    } finally {
        "reporte enviado"
    }
}

fun main(){
    println(realizarmision(nivelfuerza = 20, peligromision = 60))
    println(realizarmision(nivelfuerza = 100, peligromision = 60))
}