import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// explain container layout widget in flutter
// https://flutter.dev/docs/development/ui/layout#container

class ListViewPage extends StatefulHookConsumerWidget {
  const ListViewPage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends ConsumerState<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),

        // ListView Sample Code
        // https://api.flutter.dev/flutter/widgets/ListView-class.html
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.map),
              subtitle: const Text('Map Sub TItle'),
              hoverColor: Colors.redAccent,
              selectedColor: Colors.blueAccent,
              tileColor: Colors.greenAccent,
              shape: ShapeBorder.lerp(
                  ShapeBorder.lerp(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      0.5),
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  0.5),
              style: ListTileStyle.drawer,
              title: const Text('Map'),
            ),
            const ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        ));
  }
}
