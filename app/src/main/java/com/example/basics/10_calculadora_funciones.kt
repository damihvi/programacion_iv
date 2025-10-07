package com.example.basics

fun sumar(a: Double, b: Double): Double {
    return a + b
}

fun restar(a: Double, b: Double): Double {
    return a - b
}

fun multiplicar(a: Double, b: Double): Double {
    return a * b
}

fun dividir(a: Double, b: Double): Double {
    return if (b != 0.0) a / b else Double.NaN
}

fun main() {
    println("Calculadora")
    print("Ingresa el primer número: ")
    val num1 = readLine()!!.toDouble()

    print("Ingresa el segundo número: ")
    val num2 = readLine()!!.toDouble()

    println("Selecciona una operación: +, -, *, /")
    val operacion = readLine()!!

    val resultado = when (operacion) {
        "+" -> sumar(num1, num2)
        "-" -> restar(num1, num2)
        "*" -> multiplicar(num1, num2)
        "/" -> dividir(num1, num2)
        else -> {
            println("Operación no válida")
            return
        }
    }

    println("El resultado es: $resultado")
}
