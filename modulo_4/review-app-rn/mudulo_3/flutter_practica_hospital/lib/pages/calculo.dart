import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HospitalizationPage extends StatefulWidget {
  const HospitalizationPage({super.key});

  @override
  State<HospitalizationPage> createState() => HospitalizationPageState();
}

class HospitalizationPageState extends State<HospitalizationPage> {
  String roomType = 'General';
  String insuranceType = 'Sin seguro';
  String daysText = '';
  String dailyCostText = '';
  String resultText = '';

  void calculateCost() {
    final days = int.tryParse(daysText) ?? 0;
    final dailyCost = double.tryParse(dailyCostText.replaceAll(',', '.')) ?? 0.0;

    if (days <= 0 || dailyCost <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos para días y costo diario';
      });
      return;
    }

    // Factor de habitación
    double roomFactor = 1.0;
    if (roomType == 'General') {
      roomFactor = 1.0;
    } else if (roomType == 'Semi-privada') {
      roomFactor = 1.4;
    } else if (roomType == 'Privada') {
      roomFactor = 2.0;
    }

    // Calcular costo base con factor de habitación
    final baseCost = days * dailyCost * roomFactor;

    // Descuento por seguro
    double discountPercentage = 0;
    if (insuranceType == 'Público') {
      discountPercentage = 30;
    } else if (insuranceType == 'Privado') {
      discountPercentage = 50;
    } else if (insuranceType == 'Sin seguro') {
      discountPercentage = 0;
    }

    final discountAmount = baseCost * discountPercentage / 100;
    final finalCost = baseCost - discountAmount;

    setState(() {
      resultText =
        'Tipo de habitación: $roomType (x${roomFactor.toStringAsFixed(1)})\n'
        'Seguro médico: $insuranceType\n'
        'Días: $days\n'
        'Costo diario: \$${dailyCost.toStringAsFixed(2)}\n'
        'Costo base: \$${baseCost.toStringAsFixed(2)}\n'
        'Descuento (${discountPercentage.toStringAsFixed(0)}%): \$${discountAmount.toStringAsFixed(2)}\n'
        'Costo total: \$${finalCost.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Costo de hospitalización'),
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
              'Calcular costo de hospitalización',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const Text('Tipo de habitación:'),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: roomType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'General',
                  child: Text('General (x1.0)'),
                ),
                DropdownMenuItem(
                  value: 'Semi-privada',
                  child: Text('Semi-privada (x1.4)'),
                ),
                DropdownMenuItem(
                  value: 'Privada',
                  child: Text('Privada (x2.0)'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  roomType = value;
                });
              },
            ),

            const SizedBox(height: 16),
            const Text('Seguro médico:'),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: insuranceType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Público',
                  child: Text('Público (30% descuento)'),
                ),
                DropdownMenuItem(
                  value: 'Privado',
                  child: Text('Privado (50% descuento)'),
                ),
                DropdownMenuItem(
                  value: 'Sin seguro',
                  child: Text('Sin seguro (sin descuento)'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  insuranceType = value;
                });
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Número de días',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                daysText = value;
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Costo diario (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                dailyCostText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateCost,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 16),
            if (resultText.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    resultText,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}