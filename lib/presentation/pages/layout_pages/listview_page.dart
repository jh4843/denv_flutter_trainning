import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListViewPage extends HookConsumerWidget {
  const ListViewPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHorizontal = ref.watch(isHorizontalProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isHorizontal ? const Text('Horizontal') : const Text('Veritcal'),
              const Gap(10.0),
              Switch(
                value: isHorizontal,
                onChanged: (value) =>
                    ref.read(isHorizontalProvider.notifier).toggle(),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
              children: <Widget>[
                SizedBox(
                  width: 150,
                  child: ListTile(
                    leading: const Icon(Icons.map),
                    subtitle: const Text('Map Sub Title'),
                    hoverColor: Colors.redAccent,
                    selectedTileColor: Colors.blueAccent,
                    tileColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    title: const Text('Map'),
                  ),
                ),
                const SizedBox(
                  width: 150,
                  child: ListTile(
                    leading: Icon(Icons.photo_album),
                    title: Text('Album'),
                  ),
                ),
                const SizedBox(
                  width: 150,
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Phone'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final isHorizontalProvider = StateProvider<bool>((ref) => false);

extension IsHorizontalNotifier on StateController<bool> {
  void toggle() => state = !state;
}
