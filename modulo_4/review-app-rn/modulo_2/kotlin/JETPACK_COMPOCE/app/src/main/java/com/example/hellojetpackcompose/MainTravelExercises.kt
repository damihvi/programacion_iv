package com.example.hellojetpackcompose

import android.R
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController

sealed class TravelScreen(val route: String) {
    object Home : TravelScreen("travel_home")
    object Time : TravelScreen("travel_time")
    object Fuel : TravelScreen("travel_fuel")
    object Vacaciones : TravelScreen("travel_vacaciones")
}

class MainTravelExercises : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent { TravelNavApp() }
    }
}

@Composable
fun TravelNavApp() {
    val nav = rememberNavController()
    MaterialTheme {
        Surface(modifier = Modifier.fillMaxSize()) {
            NavHost(navController = nav, startDestination = TravelScreen.Home.route) {
                composable(TravelScreen.Home.route) { TravelHomeScreen(nav) }
                composable(TravelScreen.Time.route) { TravelTimeScreen(nav) }
                composable(TravelScreen.Fuel.route) { FuelScreen(nav) }
                composable(TravelScreen.Vacaciones.route) { VacacionesScreen(nav) }
            }
        }
    }
}

@Composable
fun TravelHomeScreen(nav: NavHostController) {
    val bg = Color(0xFF020617)
    val cardColor = Color(0xFF0F172A)
    val accent = Color(0xFF6366F1)

    Box(
        Modifier
            .fillMaxSize()
            .background(bg)
            .padding(16.dp)
    ) {
        Card(
            modifier = Modifier.align(Alignment.Center),
            colors = CardDefaults.cardColors(containerColor = cardColor)
        ) {
            Column(
                Modifier.padding(20.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(
                    text = "Utilidades",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold,
                    color = accent
                )
                Text("Elige una opción:", color = Color(0xFFE5E7EB))
                Button(
                    onClick = { nav.navigate(TravelScreen.Time.route) },
                    modifier = Modifier.fillMaxWidth(),
                    colors = ButtonDefaults.buttonColors(containerColor = accent)
                ) { Text("Tiempo de Viaje", color = Color.White) }
                Button(
                    onClick = { nav.navigate(TravelScreen.Fuel.route) },
                    modifier = Modifier.fillMaxWidth(),
                    colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF22C55E))
                ) { Text("Costo de Combustible", color = Color.White) }
                Button(
                    onClick = { nav.navigate(TravelScreen.Vacaciones.route) },
                    modifier = Modifier.fillMaxWidth(),
                    colors = ButtonDefaults.buttonColors(containerColor = Color(0xFFF97316))
                ) { Text("Días de Vacaciones", color = Color.White) }
            }
        }
    }
}

@Composable
fun TravelTimeScreen(nav: NavController) {
    val bg = Color(0xFF020617)
    val cardColor = Color(0xFF111827)
    val accent = Color(0xFF8B5CF6)

    var distance by remember { mutableStateOf("") }
    var speed by remember { mutableStateOf("") }

    val horas = travelcalculador(distance, speed)

    Box(
        Modifier
            .fillMaxSize()
            .background(bg)
            .padding(16.dp)
    ) {
        Column(Modifier.fillMaxWidth(), horizontalAlignment = Alignment.CenterHorizontally) {
            Card(
                Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(containerColor = cardColor)
            ) {
                Column(Modifier.padding(16.dp)) {
                    Text(
                        text = "Tiempo de Viaje",
                        style = MaterialTheme.typography.titleLarge,
                        color = accent,
                        fontWeight = FontWeight.Bold
                    )
                    OutlinedTextField(
                        value = distance,
                        onValueChange = { distance = it },
                        label = { Text("Distancia (km)") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    OutlinedTextField(
                        value = speed,
                        onValueChange = { speed = it },
                        label = { Text("Velocidad (km/h)") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    Text("Tiempo = ${"%.2f".format(horas)} horas", color = Color(0xFFE5E7EB))
                }
            }
            Spacer(Modifier.height(16.dp))
            Button(
                onClick = { nav.navigateUp() },
                modifier = Modifier.fillMaxWidth(),
                colors = ButtonDefaults.buttonColors(containerColor = accent)
            ) { Text("Volver", color = Color.White) }
        }
    }
}

@Composable
fun FuelScreen(nav: NavController) {
    val bg = Color(0xFF020617)
    val cardColor = Color(0xFF0F172A)
    val accent = Color(0xFFF97316)

    var distance by remember { mutableStateOf("") }
    var litersPer100 by remember { mutableStateOf("") }
    var pricePerLiter by remember { mutableStateOf("") }

    val (liters, totalCost) = fuelData(distance, litersPer100, pricePerLiter)

    Box(
        Modifier
            .fillMaxSize()
            .background(bg)
            .padding(16.dp)
    ) {
        Column(Modifier.fillMaxWidth(), horizontalAlignment = Alignment.CenterHorizontally) {
            Card(
                Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(containerColor = cardColor)
            ) {
                Column(Modifier.padding(16.dp)) {
                    Text(
                        text = "Costo de Combustible",
                        style = MaterialTheme.typography.titleLarge,
                        color = accent,
                        fontWeight = FontWeight.Bold
                    )
                    OutlinedTextField(
                        value = distance,
                        onValueChange = { distance = it },
                        label = { Text("Distancia (km)") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    OutlinedTextField(
                        value = litersPer100,
                        onValueChange = { litersPer100 = it },
                        label = { Text("Litros / 100 km") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    OutlinedTextField(
                        value = pricePerLiter,
                        onValueChange = { pricePerLiter = it },
                        label = { Text("Precio por litro ($)") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    Text("Litros necesarios = ${"%.2f".format(liters)} L", color = Color(0xFFE5E7EB))
                    Text("Costo total = ${"%.2f".format(totalCost)} $", color = Color(0xFFE5E7EB))
                }
            }
            Spacer(Modifier.height(16.dp))
            Button(
                onClick = { nav.navigateUp() },
                modifier = Modifier.fillMaxWidth(),
                colors = ButtonDefaults.buttonColors(containerColor = accent)
            ) { Text("Volver", color = Color.White) }
        }
    }
}

@Composable
fun VacacionesScreen(nav: NavController) {
    val bg = Color(0xFF020617)
    val cardColor = Color(0xFF1E293B)
    val accent = Color(0xFF0EA5E9)

    var nombre by remember { mutableStateOf("") }
    var years by remember { mutableStateOf("") }

    val diasVacaciones = calcularVacaciones(years)

    Box(
        Modifier
            .fillMaxSize()
            .background(Color(0xFFFFC0CB))
            .padding(16.dp)
    ) {
        Column(Modifier.fillMaxWidth(), horizontalAlignment = Alignment.CenterHorizontally) {
            Card(
                Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(containerColor = cardColor)
            ) {
                Column(Modifier.padding(16.dp)) {
                    Text(
                        text = "Cálculo de Vacaciones",
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.Bold,
                        color = accent
                    )
                    OutlinedTextField(
                        value = nombre,
                        onValueChange = { nombre = it },
                        label = { Text("Nombre del trabajador") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    OutlinedTextField(
                        value = years,
                        onValueChange = { years = it },
                        label = { Text("Años de servicio") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    Text("Le corresponen $diasVacaciones días de vacaciones ", color = Color(0xFFE5E7EB))
                }
            }
            Spacer(Modifier.height(16.dp))
            Button(
                onClick = { nav.navigateUp() },
                modifier = Modifier.fillMaxWidth(),
                colors = ButtonDefaults.buttonColors(containerColor = accent)
            ) { Text("Volver", color = Color.White) }
        }
    }
}

fun travelcalculador(distance: String, speed: String): Double {
    val d = distance.replace(",", ".").toDoubleOrNull() ?: 0.0
    val s = speed.replace(",", ".").toDoubleOrNull() ?: 0.0
    if (d <= 0.0 || s <= 0.0) return 0.0
    return d / s
}

fun fuelData(distance: String, litersPer100: String, pricePerLiter: String): Pair<Double, Double> {
    val d = distance.replace(",", ".").toDoubleOrNull() ?: 0.0
    val l100 = litersPer100.replace(",", ".").toDoubleOrNull() ?: 0.0
    val price = pricePerLiter.replace(",", ".").toDoubleOrNull() ?: 0.0
    if (d <= 0.0 || l100 <= 0.0 || price <= 0.0) return 0.0 to 0.0
    val liters = d * l100 / 100.0
    val cost = liters * price
    return liters to cost
}

fun calcularVacaciones(years: String): Int {
    val y = years.toIntOrNull() ?: return 0
    return when {
        y < 5 -> 10
        y in 5..15 -> 15
        else -> 20
    }
}

@Preview(showBackground = true)
@Composable
fun PreviewTravelNav() {
    TravelNavApp()
}
