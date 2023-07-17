import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// explain container layout widget in flutter
// https://flutter.dev/docs/development/ui/layout#container

class ContainerPage extends ConsumerWidget {
  final String title;

  const ContainerPage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      //drawer: const MainDrawer(),
      body: Container(
          padding: const EdgeInsets.all(50),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.purple[50],
            border: Border.all(width: 10, color: Colors.black38),
            borderRadius: BorderRadius.circular(10.0),
            // border: const Border(
            //   top: BorderSide(
            //       width: 3.0, color: Colors.black, style: BorderStyle.solid),
            //   left: BorderSide(
            //       width: 4.0, color: Colors.green, style: BorderStyle.solid),
            //   right: BorderSide(
            //       width: 5.0, color: Colors.blue, style: BorderStyle.solid),
            //   bottom: BorderSide(
            //       width: 6.0, color: Colors.red, style: BorderStyle.none),
            // ),
          ),
          child: Column(
            children: [
              // add Container widget expanded full width and height is 40% of this widget
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.yellow,
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                width: 90,
                height: 90,
                color: Colors.green,
              ),

              const SizedBox(
                height: 20,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
            ],
          )),
    );
  }
}
