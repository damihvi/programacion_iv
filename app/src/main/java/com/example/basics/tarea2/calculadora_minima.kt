package com.example.basics.tarea2

fun main() {
    var opcion: Int

    do {
        println("\nMenú:")
        println("1. Sumar")
        println("2. Restar")
        println("3. Salir")
        print("Elige una opción: ")
        opcion = readLine()?.toIntOrNull() ?: 0

        if (opcion == 1 || opcion == 2) {
            print("Primer número: ")
            val a = readLine()?.toIntOrNull() ?: 0
            print("Segundo número: ")
            val b = readLine()?.toIntOrNull() ?: 0

            val resultado = if (opcion == 1) a + b else a - b
            println("Resultado: $resultado")
        }

    } while (opcion != 3)

    println("Saliendo...")
}
