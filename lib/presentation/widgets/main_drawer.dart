import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
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
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () {
              context.go("/");
            },
          ),
          ListTile(
            title: const Text('Sign In'),
            onTap: () {
              context.go("/signin");
            },
          ),
          ExpansionTile(
            title: const Text('UI'),
            childrenPadding: const EdgeInsets.only(left: 30),
            children: [
              ListTile(
                title: const Text('Layouts'),
                leading: const Icon(Icons.dashboard),
                onTap: () {
                  context.go("/ui/layouts");
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Drawing'),
            childrenPadding: const EdgeInsets.only(left: 30),
            children: [
              ListTile(
                title: const Text('Denv Paints'),
                leading: const Icon(Icons.draw),
                onTap: () {
                  context.go("/drawing/paint");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
