package com.ute.composecamaragps

import android.Manifest
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.core.content.ContextCompat
import androidx.core.content.FileProvider

@Composable
fun CamaraArchivoScreen() {
    var fotoBitmap by remember { mutableStateOf<Bitmap?>(null) }
    var textoUbicacion by remember { mutableStateOf("Latitud: --, Longitud: --") }
    var photoUri by remember { mutableStateOf<Uri?>(null) }

    val context = LocalContext.current

    val takePictureLauncher =
        rememberLauncherForActivityResult(
            contract = ActivityResultContracts.TakePicture()
        ) { success: Boolean ->
            if (success && photoUri != null) {
                val inputStream = context.contentResolver.openInputStream(photoUri!!)
                val bitmap = BitmapFactory.decodeStream(inputStream)
                inputStream?.close()
                fotoBitmap = bitmap
            }
        }

    val cameraPermissionLauncher =
        rememberLauncherForActivityResult(
            contract = ActivityResultContracts.RequestPermission()
        ) { isGranted: Boolean ->
            if (isGranted) {
                abrirCamaraConArchivo(context, onUriReady = { uri ->
                    photoUri = uri
                    takePictureLauncher.launch(uri)
                })
            }
        }

    fun onAbrirCamaraClick() {
        val permiso = Manifest.permission.CAMERA
        val estadoPermiso = ContextCompat.checkSelfPermission(context, permiso)
        if (estadoPermiso == PackageManager.PERMISSION_GRANTED) {
            abrirCamaraConArchivo(context, onUriReady = { uri ->
                photoUri = uri
                takePictureLauncher.launch(uri)
            })
        } else {
            cameraPermissionLauncher.launch(permiso)
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = "Cámara de sistema con archivo",
            style = MaterialTheme.typography.titleLarge
        )

        Spacer(modifier = Modifier.height(24.dp))

        Button(
            onClick = { onAbrirCamaraClick() },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Abrir cámara (UI completa)")
        }

        Spacer(modifier = Modifier.height(16.dp))

        Box(
            modifier = Modifier
                .size(220.dp)
                .clip(RoundedCornerShape(16.dp))
                .background(MaterialTheme.colorScheme.surfaceVariant),
            contentAlignment = Alignment.Center
        ) {
            if (fotoBitmap != null) {
                Image(
                    bitmap = fotoBitmap!!.asImageBitmap(),
                    contentDescription = "Fotografía capturada",
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Text(
                    text = "Aquí se mostrará la fotografía guardada",
                    textAlign = TextAlign.Center
                )
            }
        }

        Spacer(modifier = Modifier.height(24.dp))

        Button(
            onClick = { /* GPS se integra desde la Parte 3 */ },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Obtener ubicación")
        }

        Spacer(modifier = Modifier.height(16.dp))

        Text(
            text = textoUbicacion,
            modifier = Modifier.fillMaxWidth(),
            textAlign = TextAlign.Center
        )
    }
}

private fun abrirCamaraConArchivo(
    context: android.content.Context,
    onUriReady: (Uri) -> Unit
) {
    val file = createImageFile(context)
    val uri = FileProvider.getUriForFile(
        context,
        "com.ute.composecamaragps.provider",
        file
    )
    onUriReady(uri)
}