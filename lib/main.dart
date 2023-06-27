import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebase_options.dart';
import 'data/models/user_model.dart';
import 'package:go_router/go_router.dart';

//import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'presentation/main/home_screen.dart';
import 'presentation/users/sign_in_screen.dart';
import 'presentation/users/sign_up_screen.dart';
import 'presentation/ui/layout_screen.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          const MyHomePage(title: 'Denv Flutter Training'),
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
        builder: (context, state) =>
            const MyHomePage(title: 'Denv Flutter Training'),
        routes: <RouteBase>[
          GoRoute(
            name: "layouts",
            path: "layouts",
            builder: (context, state) =>
                const LayoutScreen(title: 'Layout Page'),
          )
        ])
  ],
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
