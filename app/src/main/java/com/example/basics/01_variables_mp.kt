package com.example.basics

fun main() {
    println("Sistema de Gestión de Transporte Público")

    println("variables")
    val ciudad = "Quito"
    var conductor = "Carlos"

    conductor = "José"

    println("tipos de variables")
    println("tipos numericos")
    println("tipo entero")
    val pasajeros: Int = 45
    println(pasajeros)
    println("tipo double")
    val tarifa: Double = 0.35
    println(tarifa)
    println("tipo float")
    val distancia: Float = 12.5f
    println(distancia)
    println("tipo long")
    val poblacion: Long = 2_000_000L
    println(poblacion)

    println("tipo texto")
    val ruta: String = "Ruta 18"
    println(ruta)

    println("tipo char")
    val categoria: Char = 'A'
    println(categoria)

    println("tipo logico")
    val enServicio: Boolean = true
    println(enServicio)

    println("nulidad")
    val empresa: String? = "Transporte Unido"
    println(empresa)

    println("nulidad")
    val parada: String? = ""
    println(parada?.length)

    println("operacion de asercion no null")
    val longitudEmpresa = empresa!!.length

    println("interpolacion de string")
    val chofer: String = "Pedro"
    val edadChofer: Int = 45
    val ciudadChofer: String = "Guayaquil"

    println("${ruta.uppercase()} opera en ${ciudad}")
    println("En 10 anios tendra: ${edadChofer+10} anios")

    println("string multilinea")
    val mensaje = """
        Estimado $chofer
        su ruta en $ciudadChofer
        ha sido completada exitosamente
        buen trabajo
        """
    println(mensaje)

    println("conversiones")
    val textoPasajeros: String = "50"
    val pasajerosConvertidos: Int = textoPasajeros.toInt()
    println(pasajerosConvertidos)

    val valor: Double = 123.45
    val valorTexto: String = valor.toString()
    println(valorTexto)
}