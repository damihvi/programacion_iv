import 'package:flutter/material.dart';

class RouteMenuPage extends StatefulWidget {
  const RouteMenuPage({super.key});

  @override
  State<RouteMenuPage> createState() => _RouteMenuPageState();
}

class _RouteMenuPageState extends State<RouteMenuPage> {
  String? _selectedRoute;
  String? _selectedSchedule;
  final _passengersController = TextEditingController();
  String _result = '';

  final Map<String, double> _routePrices = {
    'Ruta Centro - Norte': 15.00,
    'Ruta Centro - Sur': 18.00,
    'Ruta Centro - Este': 20.00,
    'Ruta Centro - Oeste': 16.00,
  };

  final Map<String, double> _scheduleMultipliers = {
    'Matutino (6:00-9:00)': 1.2,
    'Diurno (9:00-18:00)': 1.0,
    'Nocturno (18:00-22:00)': 1.5,
  };

  void _calculateTotal() {
    if (_selectedRoute == null || _selectedSchedule == null) {
      setState(() {
        _result = 'Por favor seleccione todas las opciones';
      });
      return;
    }

    final passengers = int.tryParse(_passengersController.text);
    if (passengers == null || passengers <= 0) {
      setState(() {
        _result = 'Por favor ingrese un número válido de pasajeros';
      });
      return;
    }

    final basePrice = _routePrices[_selectedRoute]!;
    final multiplier = _scheduleMultipliers[_selectedSchedule]!;
    final pricePerPassenger = basePrice * multiplier;
    final total = pricePerPassenger * passengers;

    setState(() {
      _result = 'Precio base: \$${basePrice.toStringAsFixed(2)}\n'
          'Precio por pasajero: \$${pricePerPassenger.toStringAsFixed(2)}\n'
          'Pasajeros: $passengers\n'
          'Total: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú de Rutas del Día'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione Ruta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedRoute,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ruta disponible',
              ),
              items: _routePrices.keys.map((route) {
                return DropdownMenuItem(value: route, child: Text(route));
              }).toList(),
              onChanged: (value) => setState(() => _selectedRoute = value),
            ),
            const SizedBox(height: 20),
            const Text(
              'Horario',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedSchedule,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Seleccione horario',
              ),
              items: _scheduleMultipliers.keys.map((schedule) {
                return DropdownMenuItem(value: schedule, child: Text(schedule));
              }).toList(),
              onChanged: (value) => setState(() => _selectedSchedule = value),
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
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calculateTotal,
              child: const Text('Calcular Total'),
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
    super.dispose();
  }
}
