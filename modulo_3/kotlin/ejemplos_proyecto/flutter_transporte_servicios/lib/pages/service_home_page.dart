import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceHomePage extends StatelessWidget {
  const ServiceHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios de Transporte'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Sistema de Servicios de Transporte',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => context.go('/ticket-combo'),
                child: const Text('Combos de Boletos'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => context.go('/route-menu'),
                child: const Text('Menú de Rutas del Día'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => context.go('/order-total'),
                child: const Text('Total de Orden'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => context.go('/split-fare'),
                child: const Text('Dividir Tarifa'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => context.go('/driver-tip'),
                child: const Text('Propina para Conductor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
