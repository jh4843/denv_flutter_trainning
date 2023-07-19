// reference: https://velog.io/@sunwonsw95/GoRouter%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-Flutter-NestedRoute-%EA%B5%AC%ED%98%84
// reference: https://codewithandrea.com/articles/flutter-bottom-navigation-bar-nested-routes-gorouter/

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
          ExpansionTile(
            title: const Text('Authorization'),
            childrenPadding: const EdgeInsets.only(left: 30),
            children: [
              ListTile(
                title: const Text('Sign Up'),
                leading: const Icon(Icons.person_add),
                onTap: () {
                  context.go("/signup");
                },
              ),
              ListTile(
                title: const Text('Sign In'),
                leading: const Icon(Icons.login),
                onTap: () {
                  context.go("/signin");
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Layouts'),
            childrenPadding: const EdgeInsets.only(left: 30),
            children: [
              ListTile(
                title: const Text('Rows & Cols'),
                leading: const Icon(Icons.table_rows),
                onTap: () {
                  context.go("/rowcol");
                },
              ),
              ListTile(
                title: const Text('Container'),
                leading: const Icon(Icons.check_box_outline_blank_rounded),
                onTap: () {
                  context.go("/container");
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
                  context.go("/paint");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
