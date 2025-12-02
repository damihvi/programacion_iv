package com.ute.composecamaragps

import android.Manifest
import android.content.pm.PackageManager
import android.location.Location
import android.os.Looper
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.*
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.core.content.ContextCompat
import com.google.android.gms.location.LocationCallback
import com.google.android.gms.location.LocationRequest
import com.google.android.gms.location.LocationResult
import com.google.android.gms.location.LocationServices
import com.google.android.gms.location.Priority

@Composable
fun GpsTrackingScreen() {
    val context = LocalContext.current
    val fusedClient = remember {
        LocationServices.getFusedLocationProviderClient(context)
    }

    var gpsInfo by remember { mutableStateOf(GpsInfo()) }
    var trackingEnabled by remember { mutableStateOf(false) }

    // Callback que se ejecuta cada vez que llega una nueva ubicación
    val locationCallback = remember {
        object : LocationCallback() {
            override fun onLocationResult(result: LocationResult) {
                val location: Location? = result.lastLocation
                if (location != null) {
                    gpsInfo = location.toGpsInfo()
                }
            }
        }
    }

    // Lanzador para pedir permiso de ubicación
    val permissionLauncher =
        rememberLauncherForActivityResult(
            contract = ActivityResultContracts.RequestPermission()
        ) { granted: Boolean ->
            if (granted) {
                trackingEnabled = true
            }
        }

    fun startTracking() {
        val permiso = Manifest.permission.ACCESS_FINE_LOCATION
        val estado = ContextCompat.checkSelfPermission(context, permiso)
        if (estado == PackageManager.PERMISSION_GRANTED) {
            trackingEnabled = true
        } else {
            permissionLauncher.launch(permiso)
        }
    }

    fun stopTracking() {
        trackingEnabled = false
    }

    // Arranque y detención de las actualizaciones según el estado trackingEnabled
    LaunchedEffect(trackingEnabled) {
        if (trackingEnabled) {
            val request = LocationRequest.Builder(
                Priority.PRIORITY_HIGH_ACCURACY,
                3_000L // intervalo deseado entre actualizaciones (ms)
            )
                .setMinUpdateIntervalMillis(1_000L) // intervalo mínimo (ms)
                .setWaitForAccurateLocation(false)
                .build()

            fusedClient.requestLocationUpdates(
                request,
                locationCallback,
                Looper.getMainLooper()
            )
        } else {
            fusedClient.removeLocationUpdates(locationCallback)
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = "Tracking GPS continuo",
            style = MaterialTheme.typography.titleLarge
        )

        Spacer(modifier = Modifier.height(16.dp))

        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceEvenly
        ) {
            Button(onClick = { startTracking() }) {
                Text("Iniciar tracking")
            }
            Button(onClick = { stopTracking() }) {
                Text("Detener tracking")
            }
        }

        Spacer(modifier = Modifier.height(24.dp))

        Text("Tracking activo: ${"$"}trackingEnabled")

        Spacer(modifier = Modifier.height(16.dp))

        Text("Latitud: ${"$"}{gpsInfo.latitude ?: "--"}")
        Text("Longitud: ${"$"}{gpsInfo.longitude ?: "--"}")
        Text("Precisión (m): ${"$"}{gpsInfo.accuracy ?: "--"}")
        Text("Altitud (m): ${"$"}{gpsInfo.altitude ?: "--"}")
        Text("Velocidad (m/s): ${"$"}{gpsInfo.speedMetersPerSecond ?: "--"}")
        Text("Rumbo (°): ${"$"}{gpsInfo.bearingDegrees ?: "--"}")
        Text("Proveedor: ${"$"}{gpsInfo.provider ?: "--"}")

        Spacer(modifier = Modifier.height(16.dp))

        Text(
            text = "Mientras el tracking está activo, estos valores se actualizan en tiempo real " +
                    "según las lecturas del GPS y los sensores del dispositivo.",
            modifier = Modifier.fillMaxWidth(),
            textAlign = TextAlign.Start
        )
    }
}