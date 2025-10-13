package com.example.basics

fun main(){
    println("!listas!!!")
    val inmutablelista: List<Int> = listOf(1,2,3)
    println("lista inmutable: ${inmutablelista}")

    val mutablelista: MutableList<Int> =mutableListOf(4,5,6)
    println("lista mutable ${mutablelista}")

    val mutableLista: MutableList<Int> =mutableListOf(4,5,6)
    println("lista mutable ${mutablelista}")
    mutablelista.add(7)
    println("lista mutable ${mutablelista}")
    mutablelista.removeAt(index = 0)
    println("lista mutable ${mutablelista}")

    for(mutable in mutablelista) println(mutable)

    println("operaciones con mutable list")

    val colores = mutableListOf("rojo","verde")
    colores.add("azul")
    colores+="amarillo"
    colores.add(1,"blanco")
    println("colores")
    colores.remove("verde")
    println(colores)
    colores.removeAt(0)
    println(colores)
    colores[0]="negro"
    println(colores)
    colores.clear()
    println(colores.isEmpty())

    println("busquedas con mutable list")
    val nombres = mutableListOf("juan","luis","pedro")
    println(nombres.find {it.startsWith(prefix = "L")})
    println(nombres.firstOrNull{it.length>4})
    println(nombres.any {it.contains(char = 'j')})
    println(nombres.none{it =="x"})

    println("ordenamiento con mutable list")
    val numerosdesordenados = mutableListOf(8,3,2,4,0,6)
    println(numerosdesordenados.sorted())
    println(numerosdesordenados.sortedDescending())
    println(numerosdesordenados.distinct())
}