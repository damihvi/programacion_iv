package com.example.basics


data class jedi(
    val nombre: String,
    val edad : Int,
    val nivelfuerza: Int,
    val maestro: String?=null,
) {
    val rango: String
        get() = when {
            nivelfuerza >= 90 -> "maestro"
            nivelfuerza >= 90 -> "caballero"
            nivelfuerza >= 50 -> "padawan"
            else -> {
                "iniciado"
            }
        }
    fun puedeenseniar(): Boolean = nivelfuerza >= 70

    fun entrenar(): Boolean = edad <= 5

    }
fun main(){
    val luke = jedi(
        nombre="anakin skywalker",
        edad=25,
        nivelfuerza=75,
        maestro="obiwan kenobi")
    println(luke)
    //descentralizacion de un objeto
    val(nombre,edad,nivelfuerza) = luke
    println("nombre del jedi ${nombre}, edad: ${edad}, nivel de fuerza: ${nivelfuerza}")
    //copiar objetos
    val ashoka = luke.copy(nombre= "ashoka", nivelfuerza=80)
    println(ashoka)
    //propiedades calculadas
    print("rango de ashoka ${ashoka.rango}")
    print("ashoka puede enseniar ${ashoka.puedeenseniar()}")

}