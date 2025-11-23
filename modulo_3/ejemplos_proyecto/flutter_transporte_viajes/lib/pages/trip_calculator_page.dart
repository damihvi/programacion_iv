import 'package:flutter/material.dart';

class TripCalculatorPage extends StatefulWidget {
  const TripCalculatorPage({super.key});

  @override
  State<TripCalculatorPage> createState() => _TripCalculatorPageState();
}

class _TripCalculatorPageState extends State<TripCalculatorPage> {
  String? _selectedDestination;
  String? _selectedTransport;
  final _passengersController = TextEditingController();
  final _daysController = TextEditingController();
  String _result = '';

  final Map<String, double> _destinationPrices = {
    'Quito': 10.00,
    'Guayaquil': 20.00,
    'Cuenca': 15.00,
    'Ambato': 7.00,
    'Latacunga': 5.00,
  };

  final Map<String, double> _transportMultipliers = {
    'Autobús': 1.0,
    'Avión': 3.0,
    'Tren': 1.5,
    'Van Privada': 2.0,
  };

  void _calculateTrip() {
    if (_selectedDestination == null || _selectedTransport == null) {
      setState(() {
        _result = 'Por favor seleccione todas las opciones';
      });
      return;
    }

    final passengers = int.tryParse(_passengersController.text);
    final days = int.tryParse(_daysController.text);

    if (passengers == null || passengers <= 0 || days == null || days <= 0) {
      setState(() {
        _result = 'Por favor ingrese valores válidos';
      });
      return;
    }

    final basePrice = _destinationPrices[_selectedDestination]!;
    final transportMultiplier = _transportMultipliers[_selectedTransport]!;
    final transportCost = basePrice * transportMultiplier * passengers;
    final accommodationCost = 150.0 * days * passengers;
    final total = transportCost + accommodationCost;

    setState(() {
      _result = 'Destino: $_selectedDestination\n'
          'Transporte: $_selectedTransport\n'
          'Pasajeros: $passengers\n'
          'Días: $days\n\n'
          'Costo de transporte: \$${transportCost.toStringAsFixed(2)}\n'
          'Costo de hospedaje: \$${accommodationCost.toStringAsFixed(2)}\n'
          'Total: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Viaje'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Destino',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedDestination,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Seleccione destino',
              ),
              items: _destinationPrices.keys.map((destination) {
                return DropdownMenuItem(value: destination, child: Text(destination));
              }).toList(),
              onChanged: (value) => setState(() => _selectedDestination = value),
            ),
            const SizedBox(height: 20),
            const Text(
              'Medio de Transporte',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedTransport,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Seleccione transporte',
              ),
              items: _transportMultipliers.keys.map((transport) {
                return DropdownMenuItem(value: transport, child: Text(transport));
              }).toList(),
              onChanged: (value) => setState(() => _selectedTransport = value),
            ),
            const SizedBox(height: 20),
            const Text(
              'Número de Pasajeros',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passengersController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Cantidad de pasajeros',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Días de Estadía',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _daysController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Número de días',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calculateTrip,
              child: const Text('Calcular Viaje'),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Card(
                color: Colors.green[50],
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
    _passengersController.dispose();
    _daysController.dispose();
    super.dispose();
  }
}
