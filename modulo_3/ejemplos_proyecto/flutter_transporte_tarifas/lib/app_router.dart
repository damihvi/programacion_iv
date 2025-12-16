import 'package:go_router/go_router.dart';

import 'pages/transport_home_page.dart';
import 'pages/subscription_page.dart';
import 'pages/travel_package_page.dart';
import 'pages/ticket_purchase_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const TransportHomePage(),
    ),
    GoRoute(
      path: '/subscription',
      builder: (_, __) => const SubscriptionPage(),
    ),
    GoRoute(
      path: '/travel-package',
      builder: (_, __) => const TravelPackagePage(),
    ),
    GoRoute(
      path: '/ticket-purchase',
      builder: (_, __) => const TicketPurchasePage(),
    ),
  ],
);
