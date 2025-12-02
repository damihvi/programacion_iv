import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FareCalculatorPage extends StatefulWidget {
  const FareCalculatorPage({super.key});

  @override
  State<FareCalculatorPage> createState() => _FareCalculatorPageState();
}

class _FareCalculatorPageState extends State<FareCalculatorPage> {
  String passengerType = 'Regular';
  String distanceText = '';
  String resultText = '';

  void calculateFare() {
    final distance = double.tryParse(distanceText.replaceAll(',', '.')) ?? 0.0;

    if (distance <= 0) {
      setState(() {
        resultText = 'Ingrese una distancia válida';
      });
      return;
    }

    double baseFare = 1.50;
    double farePerKm = 0.30;
    
    double totalFare = baseFare + (distance * farePerKm);

    double discount = 0;
    if (passengerType == 'Regular') {
      discount = 0;
    } else if (passengerType == 'Estudiante') {
      discount = 25;
    } else if (passengerType == 'Adulto Mayor') {
      discount = 50;
    } else if (passengerType == 'Discapacitado') {
      discount = 100;
    }

    final discountAmount = totalFare * discount / 100;
    final finalFare = totalFare - discountAmount;

    setState(() {
      resultText =
        'Tipo de pasajero: $passengerType\n'
        'Distancia: ${distance.toStringAsFixed(2)} km\n'
        'Tarifa base: \$${baseFare.toStringAsFixed(2)}\n'
        'Tarifa calculada: \$${totalFare.toStringAsFixed(2)}\n'
        'Descuento (${discount.toStringAsFixed(0)}%): \$${discountAmount.toStringAsFixed(2)}\n'
        'Tarifa final: \$${finalFare.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular Tarifa'),
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
              'Calcular tarifa de viaje',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const Text('Tipo de pasajero:'),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: passengerType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Regular',
                  child: Text('Pasajero regular (sin descuento)'),
                ),
                DropdownMenuItem(
                  value: 'Estudiante',
                  child: Text('Estudiante (25% descuento)'),
                ),
                DropdownMenuItem(
                  value: 'Adulto Mayor',
                  child: Text('Adulto mayor (50% descuento)'),
                ),
                DropdownMenuItem(
                  value: 'Discapacitado',
                  child: Text('Persona con discapacidad (100% descuento)'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  passengerType = value;
                });
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Distancia del viaje (km)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.straighten),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                distanceText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateFare,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 16),
            if (resultText.isNotEmpty)
              Card(
                color: Colors.blue.shade50,
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
