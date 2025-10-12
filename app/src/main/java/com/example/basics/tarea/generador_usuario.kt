package com.example.basics.tarea

fun main() {
    print("Nombre: ")
    val nombre = readln()
    print("Apellido: ")
    val apellido = readln()

    var username = ""
    var i = 0

    while (i < nombre.length || i < apellido.length) {
        if (i + 1 < nombre.length) username += nombre.substring(i, i + 2)
        if (i + 1 < apellido.length) username += apellido.substring(i, i + 2)
        i += 2
    }

    while (username.length < 6) {
        username += (username.length + 1).toString()
    }

    println("Usuario generado: ${username.lowercase()}")
}
