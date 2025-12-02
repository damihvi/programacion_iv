import 'package:flutter/material.dart';

class SplitFarePage extends StatefulWidget {
  const SplitFarePage({super.key});

  @override
  State<SplitFarePage> createState() => _SplitFarePageState();
}

class _SplitFarePageState extends State<SplitFarePage> {
  final _totalFareController = TextEditingController();
  final _peopleController = TextEditingController();
  String? _selectedSplitType;
  String _result = '';

  final Map<String, String> _splitTypes = {
    'Partes Iguales': 'Todos pagan lo mismo',
    'Por Distancia': 'Según tramos recorridos',
    'Por Servicio': 'Según calidad de servicio usado',
  };

  void _calculateSplit() {
    final totalFare = double.tryParse(_totalFareController.text);
    final people = int.tryParse(_peopleController.text);

    if (totalFare == null || totalFare <= 0) {
      setState(() {
        _result = 'Por favor ingrese una tarifa total válida';
      });
      return;
    }

    if (people == null || people <= 0) {
      setState(() {
        _result = 'Por favor ingrese un número válido de personas';
      });
      return;
    }

    if (_selectedSplitType == null) {
      setState(() {
        _result = 'Por favor seleccione un tipo de división';
      });
      return;
    }

    double perPerson = totalFare / people;

    String splitInfo = '';
    switch (_selectedSplitType) {
      case 'Partes Iguales':
        splitInfo = 'Todos pagan la misma cantidad';
        break;
      case 'Por Distancia':
        splitInfo = 'División proporcional según kilómetros';
        perPerson = totalFare / people * 1.1;
        break;
      case 'Por Servicio':
        splitInfo = 'Ajuste según tipo de servicio';
        perPerson = totalFare / people * 1.05;
        break;
    }

    setState(() {
      _result = 'Tarifa Total: \$${totalFare.toStringAsFixed(2)}\n'
          'Personas: $people\n'
          'Tipo: $_selectedSplitType\n'
          '$splitInfo\n'
          'Por persona: \$${perPerson.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dividir Tarifa'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Tarifa Total',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _totalFareController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Monto total a dividir',
                prefixText: '\$',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Número de Personas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _peopleController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Cantidad de personas',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tipo de División',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedSplitType,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Seleccione tipo',
              ),
              items: _splitTypes.keys.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(type, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(_splitTypes[type]!, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) => setState(() => _selectedSplitType = value),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calculateSplit,
              child: const Text('Calcular División'),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Card(
                color: Colors.purple[50],
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
    _totalFareController.dispose();
    _peopleController.dispose();
    super.dispose();
  }
}
