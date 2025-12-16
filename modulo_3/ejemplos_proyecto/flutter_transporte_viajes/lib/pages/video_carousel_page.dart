import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoCarouselPage extends StatefulWidget {
  const VideoCarouselPage({super.key});

  @override
  State<VideoCarouselPage> createState() => _VideoCarouselPageState();
}

class _VideoCarouselPageState extends State<VideoCarouselPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final List<VideoPlayerController?> _controllers = [null, null, null, null];
  final List<bool> _isInitialized = [false, false, false, false];

  final List<Map<String, dynamic>> _videos = [
    {
      'video': 'assets/videos/promo_playa.mp4',
      'title': 'Promo Playa',
      'description': 'Video promocional de destinos de playa',
    },
    {
      'video': 'assets/videos/clip_hotel.mp4',
      'title': 'Tour Hotel',
      'description': 'Recorrido virtual por nuestros hoteles',
    },
    {
      'video': 'assets/videos/clip_tour.mp4',
      'title': 'Clip Tour',
      'description': 'Experiencias turísticas inolvidables',
    },
    {
      'video': 'assets/videos/clip_playa.mp4',
      'title': 'Clip Playa',
      'description': 'Momentos mágicos en la playa',
    },
  ];

  @override
  void initState() {
    super.initState();
    _initializeVideo(0);
  }

  Future<void> _initializeVideo(int index) async {
    if (_controllers[index] == null) {
      _controllers[index] = VideoPlayerController.asset(_videos[index]['video']);
      
      try {
        await _controllers[index]!.initialize();
        setState(() {
          _isInitialized[index] = true;
        });
        _controllers[index]!.setLooping(true);
      } catch (e) {
        setState(() {
          _isInitialized[index] = false;
        });
      }
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      // Pause previous video
      if (_controllers[_currentIndex] != null) {
        _controllers[_currentIndex]!.pause();
      }
      
      _currentIndex = index;
      
      // Initialize and play current video
      if (!_isInitialized[index]) {
        _initializeVideo(index);
      } else if (_controllers[index] != null) {
        _controllers[index]!.play();
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller?.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrusel de Videos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _videos.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                final video = _videos[index];
                final controller = _controllers[index];
                final isInitialized = _isInitialized[index];

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.black,
                            child: isInitialized && controller != null
                                ? AspectRatio(
                                    aspectRatio: controller.value.aspectRatio,
                                    child: VideoPlayer(controller),
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
                                  video['title'],
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  video['description'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 15),
                                if (isInitialized && controller != null) ...[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          controller.value.isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (controller.value.isPlaying) {
                                              controller.pause();
                                            } else {
                                              controller.play();
                                            }
                                          });
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.replay),
                                        onPressed: () {
                                          controller.seekTo(Duration.zero);
                                          controller.play();
                                        },
                                      ),
                                    ],
                                  ),
                                  VideoProgressIndicator(
                                    controller,
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
                  '${_currentIndex + 1} / ${_videos.length}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: _currentIndex < _videos.length - 1
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
                _videos.length,
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
}
