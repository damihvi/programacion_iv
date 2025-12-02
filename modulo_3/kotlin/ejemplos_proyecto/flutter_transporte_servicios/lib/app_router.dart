import 'package:go_router/go_router.dart';
import 'pages/service_home_page.dart';
import 'pages/ticket_combo_page.dart';
import 'pages/route_menu_page.dart';
import 'pages/order_total_page.dart';
import 'pages/split_fare_page.dart';
import 'pages/driver_tip_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ServiceHomePage(),
    ),
    GoRoute(
      path: '/ticket-combo',
      builder: (context, state) => const TicketComboPage(),
    ),
    GoRoute(
      path: '/route-menu',
      builder: (context, state) => const RouteMenuPage(),
    ),
    GoRoute(
      path: '/order-total',
      builder: (context, state) => const OrderTotalPage(),
    ),
    GoRoute(
      path: '/split-fare',
      builder: (context, state) => const SplitFarePage(),
    ),
    GoRoute(
      path: '/driver-tip',
      builder: (context, state) => const DriverTipPage(),
    ),
  ],
);
