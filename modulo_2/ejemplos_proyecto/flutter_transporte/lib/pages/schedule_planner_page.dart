import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SchedulePlannerPage extends StatefulWidget {
  const SchedulePlannerPage({super.key});

  @override
  State<SchedulePlannerPage> createState() => _SchedulePlannerPageState();
}

class _SchedulePlannerPageState extends State<SchedulePlannerPage> {
  String routeName = '';
  String intervalText = '';
  String hoursText = '';
  String resultText = '';

  void calculateSchedule() {
    final interval = int.tryParse(intervalText) ?? 0;
    final hours = int.tryParse(hoursText) ?? 0;

    if (routeName.isEmpty || interval <= 0 || hours <= 0) {
      setState(() {
        resultText = 'Complete todos los campos con valores válidos';
      });
      return;
    }

    final totalBuses = (hours * 60) ~/ interval;
    final lastBusTime = totalBuses * interval;

    setState(() {
      resultText =
        'Ruta: $routeName\n'
        'Intervalo entre buses: $interval minutos\n'
        'Horas de operación: $hours horas\n'
        'Número total de buses: $totalBuses\n'
        'Tiempo del último bus: ${lastBusTime ~/ 60}h ${lastBusTime % 60}min';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programar Horarios'),
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
              'Programar horarios de bus',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Nombre de la ruta',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.directions_bus),
              ),
              onChanged: (value) {
                routeName = value;
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Intervalo entre buses (minutos)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.timer),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                intervalText = value;
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Horas de operación',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.access_time_filled),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                hoursText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateSchedule,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 16),
            if (resultText.isNotEmpty)
              Card(
                color: Colors.purple.shade50,
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
