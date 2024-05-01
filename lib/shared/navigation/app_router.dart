import 'package:go_router/go_router.dart';
import 'package:airbnb_clone/screens/screens.dart';
import "package:airbnb_clone/shared/theme/colors.dart";

class AppRouter {
  late final GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
        name: "home",
        path: "/",
        builder: (context, GoRouterState state) => const HomeScreen()),
    GoRoute(
        name: "booking_details",
        path: "/booking_details",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              opaque: false,
              barrierColor: appBlack.withOpacity(0.5),
              transitionDuration: const Duration(microseconds: 300),
              child: const BookingDetailsScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) => child);
        }),
  ]);
}
