package com.ute.composecamaragps

data class GpsInfo(
    val latitude: Double? = null,
    val longitude: Double? = null,
    val accuracy: Float? = null,
    val altitude: Double? = null,
    val speedMetersPerSecond: Float? = null,
    val bearingDegrees: Float? = null,
    val provider: String? = null,
    val timestampMillis: Long? = null
)