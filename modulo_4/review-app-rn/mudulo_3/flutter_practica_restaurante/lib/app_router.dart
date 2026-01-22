import 'package:go_router/go_router.dart';

import 'pages/restaurant_home_page.dart';
import 'pages/order_total_page.dart';
import 'pages/tip_page.dart';
import 'pages/split_bill_page.dart';
import 'pages/menu_dia.dart';
import 'pages/combos.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const RestaurantHomePage(),
    ),
    GoRoute(
      path: '/order',
      builder: (_, __) => const OrderTotalPage(),
    ),
    GoRoute(
      path: '/tip',
      builder: (_, __) => const TipPage(),
    ),
    GoRoute(
      path: '/split',
      builder: (_, __) => const SplitBillPage(),
    ),
    GoRoute(
      path: '/menu',
      builder: (_, __) => const MenuDayPage(),
    ),
    GoRoute(
      path: '/combos',
      builder: (_, __) => const ComboPage(),
    ),
  ],
);
