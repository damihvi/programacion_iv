import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TravelPackagePage extends StatefulWidget {
  const TravelPackagePage({super.key});

  @override
  State<TravelPackagePage> createState() => _TravelPackagePageState();
}

class _TravelPackagePageState extends State<TravelPackagePage> {
  String packageType = 'Básico';
  String amountText = '';
  String tripsText = '';
  String resultText = '';

  void calculatePackage() {
    final amount = double.tryParse(amountText.replaceAll(',', '.')) ?? 0.0;
    final trips = double.tryParse(tripsText.replaceAll(',', '.')) ?? 0.0;

    if (amount <= 0 || trips <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos';
      });
      return;
    }

    double extraFeePerTrip = 0.0;

    if (packageType == 'Básico') {
      extraFeePerTrip = 0.50;
    } else if (packageType == 'Premium') {
      extraFeePerTrip = 0.30;
    } else if (packageType == 'VIP') {
      extraFeePerTrip = 0.10;
    }

    final totalExtraFee = extraFeePerTrip * trips;
    final totalToPay = amount + totalExtraFee;
    final costPerTrip = totalToPay / trips;

    setState(() {
      resultText =
        'Paquete: $packageType\n'
        'Costo adicional por viaje: \$${extraFeePerTrip.toStringAsFixed(2)}\n'
        'Total a pagar: \$${totalToPay.toStringAsFixed(2)}\n'
        'Costo por viaje: \$${costPerTrip.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulador de paquete'),
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
              'Cálculo de paquete de viajes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: packageType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Básico',
                  child: Text('Paquete básico'),
                ),
                DropdownMenuItem(
                  value: 'Premium',
                  child: Text('Paquete premium'),
                ),
                DropdownMenuItem(
                  value: 'VIP',
                  child: Text('Paquete VIP'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  packageType = value;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Monto del paquete (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amountText = value;
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Número de viajes',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                tripsText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculatePackage,
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
