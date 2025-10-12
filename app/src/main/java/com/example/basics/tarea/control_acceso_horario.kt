package com.example.basics.tarea

fun main() {
    print("Hora actual (0/23): ")
    val hora = readln().toInt()
    print("Rol (admin, invitado, empleado): ")
    val rol = readln().lowercase()

    val acceso = when (rol) {
        "admin" -> "Permitido"
        "empleado" -> if (hora in 6..20) "Permitido" else "Denegado"
        "invitado" -> if (hora in 9..17) "Permitido" else "Denegado"
        else -> "Rol no válido"
    }

    println("Acceso: $acceso")
}
