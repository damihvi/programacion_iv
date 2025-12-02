import 'package:go_router/go_router.dart';
import 'pages/travel_home_page.dart';
import 'pages/trip_calculator_page.dart';
import 'pages/travel_plan_page.dart';
import 'pages/destination_image_page.dart';
import 'pages/photo_carousel_page.dart';
import 'pages/promo_video_page.dart';
import 'pages/video_carousel_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const TravelHomePage(),
    ),
    GoRoute(
      path: '/trip-calculator',
      builder: (context, state) => const TripCalculatorPage(),
    ),
    GoRoute(
      path: '/travel-plan',
      builder: (context, state) => const TravelPlanPage(),
    ),
    GoRoute(
      path: '/destination-image',
      builder: (context, state) => const DestinationImagePage(),
    ),
    GoRoute(
      path: '/photo-carousel',
      builder: (context, state) => const PhotoCarouselPage(),
    ),
    GoRoute(
      path: '/promo-video',
      builder: (context, state) => const PromoVideoPage(),
    ),
    GoRoute(
      path: '/video-carousel',
      builder: (context, state) => const VideoCarouselPage(),
    ),
  ],
);
