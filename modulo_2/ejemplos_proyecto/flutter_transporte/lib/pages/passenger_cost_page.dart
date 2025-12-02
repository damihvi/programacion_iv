import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PassengerCostPage extends StatefulWidget {
  const PassengerCostPage({super.key});

  @override
  State<PassengerCostPage> createState() => _PassengerCostPageState();
}

class _PassengerCostPageState extends State<PassengerCostPage> {
  String totalCostText = '';
  String passengersText = '';
  String resultText = '';

  void calculateCostPerPassenger() {
    final totalCost = double.tryParse(totalCostText.replaceAll(',', '.')) ?? 0.0;
    final passengers = int.tryParse(passengersText) ?? 0;

    if (totalCost <= 0 || passengers <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos para costo total y número de pasajeros';
      });
      return;
    }

    final costPerPassenger = totalCost / passengers;

    setState(() {
      resultText =
        'Costo total del viaje: \$${totalCost.toStringAsFixed(2)}\n'
        'Número de pasajeros: $passengers\n'
        'Costo por pasajero: \$${costPerPassenger.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Costo por Pasajero'),
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
              'Calcular costo por pasajero',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Costo total del viaje (\$)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.payments),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                totalCostText = value;
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Número de pasajeros',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.group),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                passengersText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateCostPerPassenger,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 16),
            if (resultText.isNotEmpty)
              Card(
                color: Colors.orange.shade50,
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
