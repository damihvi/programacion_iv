import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MaintenanceCostPage extends StatefulWidget {
  const MaintenanceCostPage({super.key});

  @override
  State<MaintenanceCostPage> createState() => _MaintenanceCostPageState();
}

class _MaintenanceCostPageState extends State<MaintenanceCostPage> {
  String serviceType = 'Básico';
  String baseCostText = '';
  String resultText = '';

  void calculateMaintenanceCost() {
    final baseCost = double.tryParse(baseCostText.replaceAll(',', '.')) ?? 0.0;

    if (baseCost <= 0) {
      setState(() {
        resultText = 'Ingrese un costo base válido';
      });
      return;
    }

    double discount = 0;

    if (serviceType == 'Básico') {
      discount = 0;
    } else if (serviceType == 'Contrato anual') {
      discount = 15;
    } else if (serviceType == 'Contrato corporativo') {
      discount = 25;
    }

    final discountAmount = baseCost * discount / 100;
    final finalCost = baseCost - discountAmount;

    setState(() {
      resultText =
        'Tipo de servicio: $serviceType\n'
        'Descuento: ${discount.toStringAsFixed(0)} %\n'
        'Monto de descuento: \$${discountAmount.toStringAsFixed(2)}\n'
        'Costo final: \$${finalCost.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Costo de mantenimiento'),
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
              'Costo de mantenimiento según contrato',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: serviceType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Básico',
                  child: Text('Servicio básico'),
                ),
                DropdownMenuItem(
                  value: 'Contrato anual',
                  child: Text('Contrato anual (15% desc.)'),
                ),
                DropdownMenuItem(
                  value: 'Contrato corporativo',
                  child: Text('Contrato corporativo (25% desc.)'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  serviceType = value;
                });
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Costo base del servicio (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                baseCostText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateMaintenanceCost,
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
