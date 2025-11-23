import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TravelHomePage extends StatelessWidget {
  const TravelHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viajes y Turismo'),
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
                'Sistema de Gestión de Viajes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => context.go('/trip-calculator'),
                child: const Text('Calculadora de Viaje'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => context.go('/travel-plan'),
                child: const Text('Plan de Viaje'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => context.go('/destination-image'),
                child: const Text('Imagen de Destino'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => context.go('/photo-carousel'),
                child: const Text('Carrusel de Fotos'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => context.go('/promo-video'),
                child: const Text('Video Promocional'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => context.go('/video-carousel'),
                child: const Text('Carrusel de Videos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
