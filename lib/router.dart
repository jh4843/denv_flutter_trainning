import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/auth/sign_in_page.dart';
import 'presentation/pages/auth/sign_up_page.dart';
// layouts
import 'presentation/pages/layout_pages/row_col_page.dart';
import 'presentation/pages/layout_pages/container_page.dart';
import 'presentation/pages/layout_pages/gridview_page.dart';
import 'presentation/pages/layout_pages/listview_page.dart';
import 'presentation/pages/layout_pages/listview_page_2.dart';

// inputs
import 'presentation/pages/input_pages/text_field_page.dart';

// riverpod
import 'package:denv_flutter_training/presentation/pages/riverpod/hooks_page.dart';

// Paint
import 'package:denv_flutter_training/presentation/pages/drawing/paint_page_app.dart';
import 'package:denv_flutter_training/presentation/pages/drawing/paint_page_web.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _authShellNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'authShell');
// final _layoutShellNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'layoutShell');
// final _drawingShellNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'drawingShell');

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) =>
            const MyHomePage(title: 'Denv Flutter Training'),
        routes: <RouteBase>[
          // auth
          GoRoute(
            path: 'signin',
            builder: (context, state) => const SignInPage(title: 'Sign In'),
          ),
          GoRoute(
            path: 'signup',
            builder: (context, state) => const SignUpPage(title: 'Sign Up'),
          ),
          // layout
          GoRoute(
            name: "rowcol",
            path: "rowcol",
            builder: (context, state) => const RowColPage(title: 'Layout Page'),
          ),
          GoRoute(
            name: "container",
            path: "container",
            builder: (context, state) =>
                const ContainerPage(title: 'Layout Page'),
          ),
          GoRoute(
            name: "gridview",
            path: "gridview",
            builder: (context, state) =>
                const GridViewPage(title: 'Grid View Page'),
          ),
          GoRoute(
            name: "listview",
            path: "listview",
            builder: (context, state) =>
                const ListViewPage(title: 'List View Page'),
          ),

          GoRoute(
            name: "listview2",
            path: "listview2",
            builder: (context, state) =>
                ListViewPage2(title: 'List View Page (Long List)'),
          ),
          GoRoute(
            name: "textfield",
            path: "textfield",
            builder: (context, state) =>
                const TextFieldPage(title: 'TextField Page (Basic)'),
          ),
          GoRoute(
            name: "hooks",
            path: "hooks",
            builder: (context, state) => MyHooksPage(
              title: "My Hooks Page",
            ),
          ),
          // pating
          GoRoute(
            name: "paint",
            path: "paint",
            builder: (context, state) => kIsWeb
                ? const PaintPageWeb(title: 'Custom Paint Web Page')
                : const PaintPageApp(title: 'Custom Paint Page'),
          )
        ]),
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
