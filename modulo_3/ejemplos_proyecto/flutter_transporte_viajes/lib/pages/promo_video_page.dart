import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PromoVideoPage extends StatefulWidget {
  const PromoVideoPage({super.key});

  @override
  State<PromoVideoPage> createState() => _PromoVideoPageState();
}

class _PromoVideoPageState extends State<PromoVideoPage> {
  String? _selectedPromo;
  VideoPlayerController? _controller;
  bool _isInitialized = false;

  final Map<String, Map<String, dynamic>> _promos = {
    'Promo Playa': {
      'video': 'assets/videos/promo_playa.mp4',
      'description': 'Descubre las mejores playas y destinos costeros',
    },
    'Tour Hotel': {
      'video': 'assets/videos/clip_hotel.mp4',
      'description': 'Conoce nuestros hoteles de lujo y confort',
    },
    'Tour Completo': {
      'video': 'assets/videos/clip_tour.mp4',
      'description': 'Recorrido completo por destinos turísticos',
    },
    'Clip de Playa': {
      'video': 'assets/videos/clip_playa.mp4',
      'description': 'Momentos especiales en playas paradisíacas',
    },
  };

  Future<void> _initializeVideo(String videoPath) async {
    await _controller?.dispose();
    _controller = VideoPlayerController.asset(videoPath);
    
    try {
      await _controller!.initialize();
      setState(() {
        _isInitialized = true;
      });
      _controller!.play();
      _controller!.setLooping(true);
    } catch (e) {
      setState(() {
        _isInitialized = false;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Promocional'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione Promoción',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedPromo,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Elige una promoción',
              ),
              items: _promos.keys.map((promo) {
                return DropdownMenuItem(
                  value: promo,
                  child: Text(promo),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedPromo = value;
                  _isInitialized = false;
                });
                if (value != null) {
                  _initializeVideo(_promos[value]!['video']);
                }
              },
            ),
            const SizedBox(height: 30),
            if (_selectedPromo != null) ...[
              Expanded(
                child: Card(
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.black,
                          child: _isInitialized && _controller != null
                              ? AspectRatio(
                                  aspectRatio: _controller!.value.aspectRatio,
                                  child: VideoPlayer(_controller!),
                                )
                              : const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _selectedPromo!,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _promos[_selectedPromo]!['description'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 20),
                              if (_isInitialized && _controller != null) ...[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        _controller!.value.isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (_controller!.value.isPlaying) {
                                            _controller!.pause();
                                          } else {
                                            _controller!.play();
                                          }
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.replay),
                                      onPressed: () {
                                        _controller!.seekTo(Duration.zero);
                                        _controller!.play();
                                      },
                                    ),
                                  ],
                                ),
                                VideoProgressIndicator(
                                  _controller!,
                                  allowScrubbing: true,
                                  colors: VideoProgressColors(
                                    playedColor: Theme.of(context).primaryColor,
                                    bufferedColor: Colors.grey,
                                    backgroundColor: Colors.grey.shade300,
                                  ),
                                ),
                              ],
                            ],
                          ),
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
                    'Seleccione una promoción para ver el video',
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
