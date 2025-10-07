package com.example.basics

fun main(){
    println("!Mapas!!!")
    val fuerzajedis = mapOf(
        "luke" to 85,
        "leia" to 80,
        "oni-wan" to 95,
        "yoda" to 100

    )
    println("fuerza de los jedis : ${fuerzajedis}")

    println("mapa mutable")

    val misionescompletadas = mutableMapOf<String, Int> ()
    misionescompletadas ["luke"] = 15
    misionescompletadas ["leia"] = 15
    misionescompletadas.put("han", 20)

    println("misiones: ${misionescompletadas}")

    for ((jedi, fuerza) in fuerzajedis){
        println("$jedi tiene nivel de fuerza $fuerza")
    }

    val planetasvisitados = setOf("tatooine","coruscant","dagobah")
    println("planetas visitados: ${planetasvisitados}")

    val planetaspeligrosos = setOf("tatooine","coruscant","korriban")
    println("planetas peligrosos:  ${planetaspeligrosos}")

    println("operaciones de conjuntos")
    val interseccion = planetaspeligrosos intersect planetasvisitados
    val union = planetaspeligrosos union planetasvisitados
    val diferencia = planetaspeligrosos - planetasvisitados
    println("planetas visitados y peligrosos:  ${interseccion}")
    println("todos los planetas:  ${union}")
    println("planetas seguros visitados  ${diferencia}")




    print("Ingresa la hora (0-23): ")
    val hora = readLine()!!.toInt()

    if (hora in 7..13) {
        println("clase en la mañana")
    } else if (hora in 14..19) {
        println("clase en la tarde")
    } else {
        println("horario lectivo")
    }
}
