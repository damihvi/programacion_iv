package com.example.basics.tarea

fun main() {
    print("Temperatura actual (°C): ")
    val temp = readln().toInt()
    print("Preferencia (frío, templado, caliente): ")
    val pref = readln().lowercase()

    val resultado = when {
        pref == "frío" && temp > 22 -> "Encender aire"
        pref == "caliente" && temp < 18 -> "Encender calefacción"
        pref == "templado" && temp in 18..22 -> "En confort"
        else -> "Ventilar"
    }

    println(resultado)
}
