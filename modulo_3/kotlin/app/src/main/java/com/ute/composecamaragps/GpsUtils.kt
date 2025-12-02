package com.ute.composecamaragps


import android.Manifest
import android.content.pm.PackageManager
import android.location.Location
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.runtime.*
import androidx.compose.ui.platform.LocalContext
import androidx.core.content.ContextCompat
import com.google.android.gms.location.LocationServices

@Composable
fun rememberGpsRequester(): Pair<() -> Unit, State<GpsInfo>> {
    var gpsInfo by remember { mutableStateOf(GpsInfo()) }
    val context = LocalContext.current
    val fused = remember {
        LocationServices.getFusedLocationProviderClient(context)
    }

    val permissionLauncher =
        rememberLauncherForActivityResult(
            contract = ActivityResultContracts.RequestPermission()
        ) { granted: Boolean ->
            if (granted) {
                fused.getCurrentLocation(
                    com.google.android.gms.location.Priority.PRIORITY_HIGH_ACCURACY,
                    null
                ).addOnSuccessListener { loc: Location? ->
                    gpsInfo = loc?.toGpsInfo() ?: GpsInfo()
                }
            }
        }

    fun obtenerUbicacion() {
        val permiso = Manifest.permission.ACCESS_FINE_LOCATION
        val estado = ContextCompat.checkSelfPermission(context, permiso)

        if (estado == PackageManager.PERMISSION_GRANTED) {
            fused.getCurrentLocation(
                com.google.android.gms.location.Priority.PRIORITY_HIGH_ACCURACY,
                null
            ).addOnSuccessListener { loc: Location? ->
                gpsInfo = loc?.toGpsInfo() ?: GpsInfo()
            }
        } else {
            permissionLauncher.launch(permiso)
        }
    }

    return Pair(::obtenerUbicacion, derivedStateOf { gpsInfo })
}

private fun Location.toGpsInfo(): GpsInfo =
    GpsInfo(
        latitude = latitude,
        longitude = longitude,
        accuracy = accuracy,
        altitude = if (hasAltitude()) altitude else null,
        speedMetersPerSecond = if (hasSpeed()) speed else null,
        bearingDegrees = if (hasBearing()) bearing else null,
        provider = provider,
        timestampMillis = time
    )