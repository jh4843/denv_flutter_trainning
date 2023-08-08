import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// explain container layout widget in flutter
// https://flutter.dev/docs/development/ui/layout#container

class TextFieldPage extends StatefulHookConsumerWidget {
  const TextFieldPage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends ConsumerState<TextFieldPage> {
  final myTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        // GridView Sample Code
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: myTextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
              const Gap(10.0),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the user has entered by using the
                        // TextEditingController.
                        content: Text(myTextController.text),
                      );
                    },
                  );
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ));
  }
}
