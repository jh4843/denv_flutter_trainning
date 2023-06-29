import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(180, 205, 226, 242),
        child: Column(
          children: [
            Image.asset("asset/images/login_background.png"),
            Center(
              child: Container(
                color: const Color.fromARGB(125, 100, 122, 133),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Sign In',
                    ),
                    Text(
                      'Sign-In',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
