import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:denv_flutter_training/presentation/widgets/inputs/auth_text_field.dart';

class SignInPage extends HookConsumerWidget {
  final String title;
  const SignInPage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    final TextEditingController idController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.8),
              Colors.grey.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child:
                  // expand image following horizontal direction
                  Image.asset("assets/images/signin_background.png"),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    AuthTextField(
                      hintText: 'ID',
                      controller: idController,
                    ),
                    AuthTextField(
                      hintText: 'Password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        onTap: (int index) {
          currentIndex.value = index;

          switch (currentIndex.value) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/signup');
              break;
            default:
              context.go('/');
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Sign up',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
