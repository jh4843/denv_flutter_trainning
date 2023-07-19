import 'package:denv_flutter_training/presentation/pages/drawing/paint_page.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/auth/sign_in_page.dart';
import 'presentation/pages/auth/sign_up_page.dart';
// layouts
import 'presentation/pages/layout_pages/row_col_page.dart';
import 'presentation/pages/layout_pages//container_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _authShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'authShell');
final _layoutShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'layoutShell');
final _drawingShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'drawingShell');

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          const MyHomePage(title: 'Denv Flutter Training'),
      routes: const [],
    ),
    ShellRoute(
      navigatorKey: _authShellNavigatorKey,
      builder: (context, state, child) => AuthShell(state: state, child: child),
      routes: <RouteBase>[
        GoRoute(
          path: '/signin',
          builder: (context, state) => const SignInPage(title: 'Sign In'),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => const SignUpPage(title: 'Sign Up'),
        ),
      ],
    ),
    //
    ShellRoute(
      navigatorKey: _layoutShellNavigatorKey,
      builder: (context, state, child) =>
          LayoutShell(state: state, child: child),
      routes: <RouteBase>[
        GoRoute(
          name: "Rows Columns",
          path: "/rowcol",
          builder: (context, state) => const RowColPage(title: 'Layout Page'),
        ),
        GoRoute(
          name: "Container",
          path: "/container",
          builder: (context, state) =>
              const ContainerPage(title: 'Layout Page'),
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: _drawingShellNavigatorKey,
      builder: (context, state, child) =>
          DrawerShell(state: state, child: child),
      routes: <RouteBase>[
        GoRoute(
          name: "paint",
          path: "/paint",
          builder: (context, state) =>
              const PaintPage(title: 'Custom Paint Page'),
        )
      ],
    )
  ],
);

class AuthShell extends StatelessWidget {
  const AuthShell({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 300.0,
            color: Colors.black,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  onTap: () => context.go('/signin'),
                  title: const Text('Go to Sign In Page',
                      style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  onTap: () => context.go('/signup'),
                  title: const Text('Go to Sign Up Page',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class LayoutShell extends StatelessWidget {
  const LayoutShell({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 300.0,
            color: Colors.black,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  onTap: () => context.go('/rowcol'),
                  title: const Text('Go to Row and Col layout page',
                      style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  onTap: () => context.go('/container'),
                  title: const Text('Go to Container layout page',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class DrawerShell extends StatelessWidget {
  const DrawerShell({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 300.0,
            color: Colors.black,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  onTap: () => context.go('/paint'),
                  title: const Text('Go to Row and Col layout page',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
