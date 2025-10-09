package com.example.basics

enum class tiposable(val color: String, val poder: Int) {
    azul(color= "azul", poder = 85){
        override fun descripcion()="sable tradicional de los jedis"
    },
    verde(color="verde",poder=90){
        override fun descripcion()="sable de los jedi consulares"
    },
    rojo(color="rojo",poder=95){
        override fun descripcion()="sable de los sith"
    },
    morado(color="morado",poder=95){
        override fun descripcion()="sable equilibra luz y oscuridad"
    };
    abstract fun descripcion(): String
    companion object{
        fun porcolor(color: String)= values().find {it.color==color}
    }
}
class sabledeluz(val tipo: tiposable,val portador: String){
    fun activar() ="!zzzrum! el sable de color ${tipo.color} de ${portador} se enciendde"
    fun info() = "${tipo.descripcion()} - tipo poder ${tipo.poder}"
}

fun main(){
    val sablewindoo = sabledeluz(tiposable.morado, portador="windoo")
    println(sablewindoo)
    println(sablewindoo.activar())
    println(sablewindoo.info())

    val sableluke = sabledeluz(tiposable.verde, portador="luke skywalker")
    println(sableluke)
    println(sableluke.activar())
    println(sableluke.info())
}
