import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransportHealthHomePage extends StatelessWidget {
  const TransportHealthHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Salud y Seguridad en Transporte')),
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

            ElevatedButton(
              onPressed: () => context.go('/vehicle-weight'),
              child: const Text('Índice de carga del vehículo'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/fuel-consumption'),
              child: const Text('Consumo de combustible por distancia'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/maintenance-cost'),
              child: const Text('Costo de mantenimiento'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/rental-cost'),
              child: const Text('Costo de alquiler de vehículo'),
            ),
          ],
        ),
      ),
    );
  }
}
