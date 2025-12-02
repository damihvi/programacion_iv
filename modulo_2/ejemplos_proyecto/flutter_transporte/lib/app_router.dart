import 'package:go_router/go_router.dart';

import 'pages/transport_home_page.dart';
import 'pages/fare_calculator_page.dart';
import 'pages/route_distance_page.dart';
import 'pages/passenger_cost_page.dart';
import 'pages/schedule_planner_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const TransportHomePage(),
    ),
    GoRoute(
      path: '/fare',
      builder: (_, __) => const FareCalculatorPage(),
    ),
    GoRoute(
      path: '/route',
      builder: (_, __) => const RouteDistancePage(),
    ),
    GoRoute(
      path: '/passenger',
      builder: (_, __) => const PassengerCostPage(),
    ),
    GoRoute(
      path: '/schedule',
      builder: (_, __) => const SchedulePlannerPage(),
    ),
  ],
);
