import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RentalCostPage extends StatefulWidget {
  const RentalCostPage({super.key});

  @override
  State<RentalCostPage> createState() => _RentalCostPageState();
}

class _RentalCostPageState extends State<RentalCostPage> {
  String vehicleType = 'Sedán';
  String insuranceType = 'Sin seguro';
  String daysText = '';
  String dailyCostText = '';
  String resultText = '';

  void calculateRentalCost() {
    final days = int.tryParse(daysText) ?? 0;
    final dailyCost = double.tryParse(dailyCostText.replaceAll(',', '.')) ?? 0.0;

    if (days <= 0 || dailyCost <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos para días y costo diario';
      });
      return;
    }

    // Factor de vehículo
    double vehicleFactor = 1.0;
    if (vehicleType == 'Sedán') {
      vehicleFactor = 1.0;
    } else if (vehicleType == 'SUV') {
      vehicleFactor = 1.3;
    } else if (vehicleType == 'Minibús') {
      vehicleFactor = 1.8;
    }

    // Calcular costo base con factor de vehículo
    final baseCost = days * dailyCost * vehicleFactor;

    // Descuento por seguro
    double insurancePercentage = 0;
    if (insuranceType == 'Básico') {
      insurancePercentage = 10;
    } else if (insuranceType == 'Completo') {
      insurancePercentage = 20;
    } else if (insuranceType == 'Sin seguro') {
      insurancePercentage = 0;
    }

    final insuranceAmount = baseCost * insurancePercentage / 100;
    final finalCost = baseCost + insuranceAmount;

    setState(() {
      resultText =
        'Tipo de vehículo: $vehicleType (x${vehicleFactor.toStringAsFixed(1)})\n'
        'Seguro: $insuranceType\n'
        'Días: $days\n'
        'Costo diario base: \$${dailyCost.toStringAsFixed(2)}\n'
        'Costo base: \$${baseCost.toStringAsFixed(2)}\n'
        'Costo de seguro (${insurancePercentage.toStringAsFixed(0)}%): \$${insuranceAmount.toStringAsFixed(2)}\n'
        'Costo total: \$${finalCost.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alquiler de vehículo'),
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
              'Calcular costo de alquiler',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const Text('Tipo de vehículo:'),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: vehicleType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Sedán',
                  child: Text('Sedán (x1.0)'),
                ),
                DropdownMenuItem(
                  value: 'SUV',
                  child: Text('SUV (x1.3)'),
                ),
                DropdownMenuItem(
                  value: 'Minibús',
                  child: Text('Minibús (x1.8)'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  vehicleType = value;
                });
              },
            ),

            const SizedBox(height: 16),
            const Text('Tipo de seguro:'),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: insuranceType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Básico',
                  child: Text('Básico (+10%)'),
                ),
                DropdownMenuItem(
                  value: 'Completo',
                  child: Text('Completo (+20%)'),
                ),
                DropdownMenuItem(
                  value: 'Sin seguro',
                  child: Text('Sin seguro'),
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
              onPressed: calculateRentalCost,
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
