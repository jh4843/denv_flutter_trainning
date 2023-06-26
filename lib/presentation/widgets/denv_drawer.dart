import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DenvDrawer extends StatelessWidget {
  const DenvDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Jaehyeok"),
            accountEmail: Text("creamboy1@naver.com"),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            arrowColor: Colors.redAccent,
          ),
          ListTile(
            title: const Text('Sign In'),
            onTap: () {
              context.go("/signin");
            },
          ),
          ListTile(
            title: const Text('Layouts'),
            onTap: () {
              context.go("/layouts");
            },
          ),
        ],
      ),
    );
  }
}
