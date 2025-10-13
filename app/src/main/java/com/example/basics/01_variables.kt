package com.example.basics

fun main() {
    println("variables")
    val planeta = "tatooine"
    var jedi = "anakin"

    jedi = "obiwan"

    println("tipos de variables")
    println("tipos numericos")
    println("tipo entero")
    val edad: Int = 25
    println(edad)
    println("tipo double")
    val altura: Double = 25.5
    println(altura)
    println("tipo float")
    val peso: Float = 25.5f
    println(peso)
    println("tipo long")
    val poblacion: Long = 2_000_0000_000L
    println(poblacion)

    println("tipo texto")
    val nombre: String = "obi-wan kenobi"
    println(nombre)

    println("tipo char")
    val inicial: Char = '0'
    println(inicial)

    println("tipo logico")
    val esjedi: Boolean = true
    println(esjedi)

    println("nulidad")
    val apellido: String? = "herrera"
    println(apellido)

    println("nulidad")
    val ciudad: String? = ""
    println(ciudad?.length)

    println("operacion de asercion no null")
    val longitudSegura = apellido!!.length

    println("interpolacion de string")
    val nombreprincesa: String = "leia"
    val edadprincesa: Int = 19
    val planetaprincesa: String = "alderan"

    println("${nombre.uppercase()} nacio en ${planeta}")
    println("En 10 anios tendra: ${edad+10} anios")

    println("string multilinea")
    val mensaje = """
        Querido $nombre
        tu mision en $planeta
        ha sido completada exitosamente
        que la fuerza te acompañe
        """
    println(mensaje)

    println("conversiones")
    val textoedad: String = "25"
    val edadconvertida: Int = textoedad.toInt()
    println(edadconvertida)

    val numero: Double = 50.8
    val numeroconvertido: String = numero.toString()
    println(numeroconvertido)





}