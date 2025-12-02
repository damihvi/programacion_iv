package com.ute.composecamaragps

import androidx.compose.foundation.layout.*
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp

@Composable
fun CamaraGpsScreen() {
    val (obtenerUbicacion, gpsState) = rememberGpsRequester()
    val gpsInfo = gpsState.value

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = "Cámara y GPS con Jetpack Compose",
            style = MaterialTheme.typography.titleLarge
        )

        Spacer(modifier = Modifier.height(24.dp))

        Button(
            onClick = { /* aquí se mantiene la lógica de cámara estudiada en Partes 2/3 */ },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Abrir cámara")
        }

        Spacer(modifier = Modifier.height(16.dp))

        Button(
            onClick = { obtenerUbicacion() },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Obtener ubicación")
        }

        Spacer(modifier = Modifier.height(16.dp))

        Button(
            onClick = { obtenerUbicacion() },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Obtener ubicación")
        }

        Spacer(modifier = Modifier.height(16.dp))

        Text("Latitud: ${gpsInfo.latitude ?: "--"}")
        Text("Longitud: ${gpsInfo.longitude ?: "--"}")
        Text("Precisión (m): ${gpsInfo.accuracy ?: "--"}")
        Text("Altitud (m): ${gpsInfo.altitude ?: "--"}")
        Text("Velocidad (m/s): ${gpsInfo.speedMetersPerSecond ?: "--"}")
        Text("Rumbo (°): ${gpsInfo.bearingDegrees ?: "--"}")
        Text("Proveedor: ${gpsInfo.provider ?: "--"}")

        Text(
            text = "Estos valores dependen de los sensores disponibles y de la calidad de la señal.",
            modifier = Modifier
                .fillMaxWidth()
                .padding(top = 16.dp),
            textAlign = TextAlign.Start
        )
    }
}