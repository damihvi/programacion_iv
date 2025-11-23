import 'package:flutter/material.dart';

class DestinationImagePage extends StatefulWidget {
  const DestinationImagePage({super.key});

  @override
  State<DestinationImagePage> createState() => _DestinationImagePageState();
}

class _DestinationImagePageState extends State<DestinationImagePage> {
  String? _selectedDestination;
  
  final Map<String, Map<String, dynamic>> _destinations = {
    'Destino Destacado': {
      'image': 'assets/images/destino_destacado.jpg',
      'description': 'Principal destino turístico del año',
    },
    'Playa Paraíso 1': {
      'image': 'assets/images/playa_1.jpeg',
      'description': 'Hermosas playas de arena blanca',
    },
    'Playa Paraíso 2': {
      'image': 'assets/images/playa_2.jpg',
      'description': 'Destino tropical con aguas cristalinas',
    },
    'Playa Paraíso 3': {
      'image': 'assets/images/playa_3.jpg',
      'description': 'Relájate en nuestras mejores playas',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagen de Destino'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione Destino',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedDestination,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Elige un punto de transporte',
              ),
              items: _destinations.keys.map((destination) {
                return DropdownMenuItem(
                  value: destination,
                  child: Text(destination),
                );
              }).toList(),
              onChanged: (value) => setState(() => _selectedDestination = value),
            ),
            const SizedBox(height: 30),
            if (_selectedDestination != null) ...[
              Expanded(
                child: Card(
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          _destinations[_selectedDestination]!['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              _selectedDestination!,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _destinations[_selectedDestination]!['description'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              const Expanded(
                child: Center(
                  child: Text(
                    'Seleccione un destino para ver su imagen',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
