import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VehicleWeightPage extends StatefulWidget {
  const VehicleWeightPage({super.key});

  @override
  State<VehicleWeightPage> createState() => _VehicleWeightPageState();
}

class _VehicleWeightPageState extends State<VehicleWeightPage> {
  String weightText = '';
  String capacityText = '';
  String resultText = '';

  void calculateWeightIndex() {
    final weight = double.tryParse(weightText.replaceAll(',', '.')) ?? 0.0;
    final capacity = double.tryParse(capacityText.replaceAll(',', '.')) ?? 0.0;

    if (weight <= 0 || capacity <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos';
      });
      return;
    }

    final index = (weight / capacity) * 100;
    String status = '';
    String recommendation = '';

    if (index < 70) {
      status = 'Carga baja';
      recommendation = 'Puede agregar más carga';
    } else if (index < 90) {
      status = 'Carga normal';
      recommendation = 'Carga óptima para el viaje';
    } else if (index < 100) {
      status = 'Carga alta';
      recommendation = 'Cuidado, cerca del límite';
    } else {
      status = 'Sobrecarga';
      recommendation = 'PELIGRO: Reducir carga inmediatamente';
    }

    setState(() {
      resultText =
        'Carga actual: ${weight.toStringAsFixed(1)} kg\n'
        'Capacidad máxima: ${capacity.toStringAsFixed(1)} kg\n'
        'Índice de carga: ${index.toStringAsFixed(1)}%\n'
        'Estado: $status\n'
        'Recomendación: $recommendation';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Índice de carga'),
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
              'Calcular índice de carga del vehículo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Carga actual (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                weightText = value;
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Capacidad máxima (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                capacityText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateWeightIndex,
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
