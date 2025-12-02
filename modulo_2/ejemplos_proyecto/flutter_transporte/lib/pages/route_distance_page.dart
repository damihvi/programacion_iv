import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteDistancePage extends StatefulWidget {
  const RouteDistancePage({super.key});

  @override
  State<RouteDistancePage> createState() => _RouteDistancePageState();
}

class _RouteDistancePageState extends State<RouteDistancePage> {
  String speedText = '';
  String timeText = '';
  String resultText = '';

  void calculateDistance() {
    final speed = double.tryParse(speedText.replaceAll(',', '.')) ?? 0.0;
    final time = double.tryParse(timeText.replaceAll(',', '.')) ?? 0.0;

    if (speed <= 0 || time <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos para velocidad y tiempo';
      });
      return;
    }

    final distance = speed * time;

    setState(() {
      resultText =
        'Velocidad promedio: ${speed.toStringAsFixed(2)} km/h\n'
        'Tiempo de viaje: ${time.toStringAsFixed(2)} horas\n'
        'Distancia total: ${distance.toStringAsFixed(2)} km';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular Distancia'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Calcular distancia de ruta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Velocidad promedio (km/h)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.speed),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                speedText = value;
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Tiempo de viaje (horas)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.access_time),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                timeText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateDistance,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 16),
            if (resultText.isNotEmpty)
              Card(
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    resultText,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
