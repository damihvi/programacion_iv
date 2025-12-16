import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(const TransportHealthApp());
}

class TransportHealthApp extends StatelessWidget {
  const TransportHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Salud y Seguridad en Transporte',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
