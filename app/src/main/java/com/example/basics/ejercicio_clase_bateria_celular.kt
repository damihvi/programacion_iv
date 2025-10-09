package com.example.basics

fun main() {
    var bateria = 100

    while (bateria >= 0) {
        when (bateria) {
            100 -> println("Bateria al $bateria% - Cargado ")
            50 -> println("Bateria al $bateria% - Mitad de bateria")
            10 -> println("Bateria al $bateria% - Conecte el cargador")
            0 -> println("Bateria al $bateria% - Apagado")
        }
        bateria -= 10
    }
}
