import 'package:go_router/go_router.dart';
import 'package:widgets_app/Presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  // initialLocation: '/', podemos indicar desde que pantalla queremos empezar
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);