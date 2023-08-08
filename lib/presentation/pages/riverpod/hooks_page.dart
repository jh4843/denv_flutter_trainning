import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// ignore: must_be_immutable
class MyHooksPage extends HookConsumerWidget {
  final String title;
  MyHooksPage({super.key, required this.title});

  int specificValue = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = useState(0);

    useEffect(() {
      print('useEffect');
      return () {
        print('dispose');
      };
    }, [specificValue]);

    print('화면이 갱신되었습니다.');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Text(counter.value.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
          if (counter.value % 5 == 0) {
            specificValue++;
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
