import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// explain container layout widget in flutter
// https://flutter.dev/docs/development/ui/layout#container

class GridViewPage extends StatefulHookConsumerWidget {
  const GridViewPage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends ConsumerState<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        // GridView Sample Code
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 5,
          children: List.generate(30, (index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.purple[50],
                border: Border.all(width: 10, color: Colors.black38),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            );
          }),
        ));
  }
}
