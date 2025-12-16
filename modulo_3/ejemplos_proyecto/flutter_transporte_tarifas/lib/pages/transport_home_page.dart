import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransportHomePage extends StatelessWidget {
  const TransportHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sistema de Tarifas - Transporte')),
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
              onPressed: () => context.go('/subscription'),
              child: const Text('Suscripción mensual'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/travel-package'),
              child: const Text('Simulador de paquete de viajes'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/ticket-purchase'),
              child: const Text('Comisión compra de boletos'),
            ),
          ],
        ),
      ),
    );
  }
}
