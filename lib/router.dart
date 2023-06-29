import 'package:denv_flutter_training/presentation/pages/drawing/paint_screen.dart';
import 'package:go_router/go_router.dart';
import 'presentation/pages/home/home_screen.dart';
import 'presentation/pages/auth/sign_in_screen.dart';
import 'presentation/pages/auth/sign_up_screen.dart';
import 'presentation/pages/ui/layout_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(title: 'Denv Flutter Training'),
      routes: const [],
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => const SignInScreen(title: 'Sign In'),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(title: 'Sign Up'),
    ),
    //
    GoRoute(
      path: '/ui',
      builder: (context, state) => MyHomePage(title: 'UI Training'),
      routes: <RouteBase>[
        GoRoute(
          name: "layouts",
          path: "layouts",
          builder: (context, state) => const LayoutScreen(title: 'Layout Page'),
        )
      ],
    ),
    GoRoute(
      path: '/drawing',
      builder: (context, state) => MyHomePage(title: 'Denv Flutter Training'),
      routes: <RouteBase>[
        GoRoute(
          name: "paint",
          path: "paint",
          builder: (context, state) =>
              const PaintScreen(title: 'Custom Paint Page'),
        )
      ],
    )
  ],
);
