import 'package:flutter/material.dart';

class DriverTipPage extends StatefulWidget {
  const DriverTipPage({super.key});

  @override
  State<DriverTipPage> createState() => _DriverTipPageState();
}

class _DriverTipPageState extends State<DriverTipPage> {
  final _fareController = TextEditingController();
  String? _selectedTipPercentage;
  String? _selectedServiceQuality;
  String _result = '';

  final Map<String, double> _tipPercentages = {
    '5%': 0.05,
    '10%': 0.10,
    '15%': 0.15,
    '20%': 0.20,
  };

  final Map<String, double> _qualityBonuses = {
    'Excelente': 5.00,
    'Bueno': 2.00,
    'Regular': 0.00,
  };

  void _calculateTip() {
    final fare = double.tryParse(_fareController.text);

    if (fare == null || fare <= 0) {
      setState(() {
        _result = 'Por favor ingrese una tarifa válida';
      });
      return;
    }

    if (_selectedTipPercentage == null || _selectedServiceQuality == null) {
      setState(() {
        _result = 'Por favor seleccione todas las opciones';
      });
      return;
    }

    final tipAmount = fare * _tipPercentages[_selectedTipPercentage]!;
    final qualityBonus = _qualityBonuses[_selectedServiceQuality]!;
    final totalTip = tipAmount + qualityBonus;
    final finalTotal = fare + totalTip;

    setState(() {
      _result = 'Tarifa: \$${fare.toStringAsFixed(2)}\n'
          'Propina ($_selectedTipPercentage): \$${tipAmount.toStringAsFixed(2)}\n'
          'Bonificación por calidad: \$${qualityBonus.toStringAsFixed(2)}\n'
          'Propina total: \$${totalTip.toStringAsFixed(2)}\n'
          'Total a pagar: \$${finalTotal.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Propina para Conductor'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Tarifa del Viaje',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _fareController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Monto de la tarifa',
                prefixText: '\$',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Porcentaje de Propina',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedTipPercentage,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Seleccione porcentaje',
              ),
              items: _tipPercentages.keys.map((percentage) {
                return DropdownMenuItem(value: percentage, child: Text(percentage));
              }).toList(),
              onChanged: (value) => setState(() => _selectedTipPercentage = value),
            ),
            const SizedBox(height: 20),
            const Text(
              'Calidad del Servicio',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedServiceQuality,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Evalúe el servicio',
              ),
              items: _qualityBonuses.keys.map((quality) {
                return DropdownMenuItem(value: quality, child: Text(quality));
              }).toList(),
              onChanged: (value) => setState(() => _selectedServiceQuality = value),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calculateTip,
              child: const Text('Calcular Propina'),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Card(
                color: Colors.teal[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _result,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fareController.dispose();
    super.dispose();
  }
}
