import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebase_options.dart';
import 'domain/entities/user_entity.dart';

//import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:riverpod_annotation/riverpod_annotation.dart';
import './router.dart';

import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (defaultTargetPlatform != TargetPlatform.windows &&
      defaultTargetPlatform != TargetPlatform.linux) {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } else {
    print(
        'DefaultFirebaseOptions are not supported for this platform. $defaultTargetPlatform');
  }

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
  UserEntity? userModel;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.pink,
          labelStyle: TextStyle(color: Colors.green), // color for text
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
