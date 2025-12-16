import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FuelConsumptionPage extends StatefulWidget {
  const FuelConsumptionPage({super.key});

  @override
  State<FuelConsumptionPage> createState() => _FuelConsumptionPageState();
}

class _FuelConsumptionPageState extends State<FuelConsumptionPage> {
  String distanceText = '';
  String weightText = '';
  String resultText = '';

  void calculateFuelConsumption() {
    final distance = double.tryParse(distanceText.replaceAll(',', '.')) ?? 0.0;
    final weight = double.tryParse(weightText.replaceAll(',', '.')) ?? 0.0;

    if (distance <= 0 || weight <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos para distancia y peso del pasajero';
      });
      return;
    }

    // Consumo base por km
    double baseFuelRate = 0.10; // litros por km
    
    // Factor adicional por peso (cada 10kg aumenta 0.5% el consumo)
    double weightFactor = 1 + (weight / 10) * 0.005;
    
    final fuelNeeded = distance * baseFuelRate * weightFactor;

    setState(() {
      resultText =
        'Distancia: ${distance.toStringAsFixed(1)} km\n'
        'Peso promedio de pasajeros: ${weight.toStringAsFixed(1)} kg\n'
        'Factor de peso: ${weightFactor.toStringAsFixed(3)}\n'
        'Combustible necesario: ${fuelNeeded.toStringAsFixed(2)} litros';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumo de combustible'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Calcular consumo por distancia y carga',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Distancia del viaje (km)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                distanceText = value;
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Peso promedio de pasajeros (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                weightText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateFuelConsumption,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
