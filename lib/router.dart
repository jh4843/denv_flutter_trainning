import 'package:denv_flutter_training/presentation/pages/drawing/paint_page.dart';

import 'package:go_router/go_router.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/auth/sign_in_page.dart';
import 'presentation/pages/auth/sign_up_page.dart';
// layouts
import 'presentation/pages/layout_pages/row_col_page.dart';
import 'presentation/pages/layout_pages//container_page.dart';

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
      name: "Authorization",
      path: "/auth",
      builder: (context, state) =>
          const MyHomePage(title: 'Denv Flutter Training'),
      routes: <RouteBase>[
        GoRoute(
          path: 'signin',
          builder: (context, state) => const SignInPage(title: 'Sign In'),
        ),
        GoRoute(
          path: 'signup',
          builder: (context, state) => const SignUpPage(title: 'Sign Up'),
        ),
      ],
    ),
    //
    GoRoute(
      name: "layouts",
      path: "/layouts",
      builder: (context, state) =>
          const MyHomePage(title: 'Denv Flutter Training'),
      routes: <RouteBase>[
        GoRoute(
          name: "Rows Columns",
          path: "rowcol",
          builder: (context, state) => const RowColPage(title: 'Layout Page'),
        ),
        GoRoute(
          name: "Container",
          path: "container",
          builder: (context, state) =>
              const ContainerPage(title: 'Layout Page'),
        ),
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
