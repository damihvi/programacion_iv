import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransportHomePage extends StatelessWidget {
  const TransportHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Transporte Público'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione una opción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: () => context.go('/fare'),
              icon: const Icon(Icons.attach_money),
              label: const Text('Calcular tarifa de viaje'),
            ),
            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: () => context.go('/route'),
              icon: const Icon(Icons.route),
              label: const Text('Calcular distancia de ruta'),
            ),
            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: () => context.go('/passenger'),
              icon: const Icon(Icons.people),
              label: const Text('Calcular costo por pasajero'),
            ),
            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: () => context.go('/schedule'),
              icon: const Icon(Icons.schedule),
              label: const Text('Programar horarios de bus'),
            ),
          ],
        ),
      ),
    );
  }
}
