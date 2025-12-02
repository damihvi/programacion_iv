import 'package:flutter/material.dart';

class PhotoCarouselPage extends StatefulWidget {
  const PhotoCarouselPage({super.key});

  @override
  State<PhotoCarouselPage> createState() => _PhotoCarouselPageState();
}

class _PhotoCarouselPageState extends State<PhotoCarouselPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> _photos = [
    {
      'image': 'assets/images/destino_destacado.jpg',
      'title': 'Destino Destacado',
      'description': 'El mejor destino turístico del año',
    },
    {
      'image': 'assets/images/playa_1.jpeg',
      'title': 'Playa Paraíso 1',
      'description': 'Arena blanca y aguas cristalinas te esperan',
    },
    {
      'image': 'assets/images/playa_2.jpg',
      'title': 'Playa Paraíso 2',
      'description': 'Disfruta del sol y la naturaleza',
    },
    {
      'image': 'assets/images/playa_3.jpg',
      'title': 'Playa Paraíso 3',
      'description': 'Relájate en un ambiente tropical único',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrusel de Fotos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _photos.length,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemBuilder: (context, index) {
                final photo = _photos[index];
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Image.asset(
                            photo['image'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  photo['title'],
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  photo['description'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _currentIndex > 0
                      ? () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                ),
                const SizedBox(width: 20),
                Text(
                  '${_currentIndex + 1} / ${_photos.length}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: _currentIndex < _photos.length - 1
                      ? () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _photos.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
