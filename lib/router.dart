import 'package:denv_flutter_training/presentation/pages/drawing/paint_page.dart';
import 'package:go_router/go_router.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/auth/sign_in_page.dart';
import 'presentation/pages/auth/sign_up_page.dart';
import 'presentation/pages/ui/layout_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          const MyHomePage(title: 'Denv Flutter Training'),
      routes: const [],
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => const SignInPage(title: 'Sign In'),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpPage(title: 'Sign Up'),
    ),
    //
    GoRoute(
      path: '/ui',
      builder: (context, state) => const MyHomePage(title: 'UI Training'),
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
      builder: (context, state) =>
          const MyHomePage(title: 'Denv Flutter Training'),
      routes: <RouteBase>[
        GoRoute(
          name: "paint",
          path: "paint",
          builder: (context, state) =>
              const PaintPage(title: 'Custom Paint Page'),
        )
      ],
    )
  ],
);
