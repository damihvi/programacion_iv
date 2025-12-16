import 'package:go_router/go_router.dart';

import 'pages/transport_health_home_page.dart';
import 'pages/vehicle_weight_page.dart';
import 'pages/fuel_consumption_page.dart';
import 'pages/maintenance_cost_page.dart';
import 'pages/rental_cost_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const TransportHealthHomePage(),
    ),
    GoRoute(
      path: '/vehicle-weight',
      builder: (_, __) => const VehicleWeightPage(),
    ),
    GoRoute(
      path: '/fuel-consumption',
      builder: (_, __) => const FuelConsumptionPage(),
    ),
    GoRoute(
      path: '/maintenance-cost',
      builder: (_, __) => const MaintenanceCostPage(),
    ),
    GoRoute(
      path: '/rental-cost',
      builder: (_, __) => const RentalCostPage(),
    ),
  ],
);
