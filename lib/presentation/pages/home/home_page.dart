import 'package:flutter/material.dart';
import '../../widgets/main_drawer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'home_page.g.dart';

// final providerCount = StateProvider((ref) {
//   return 0;
// });

// Code generation ex
// $ cmd: pub run build_runner watch -d
// @riverpod
// int count(CountRef ref) {
//   return 0;
// }

// class-based
@riverpod
class ClassCounter extends _$ClassCounter {
  /// Classes annotated by `@riverpod` **must** define a [build] function.
  /// This function is expected to return the initial state of your shared state.
  /// It is totally acceptable for this function to return a [Future] or [Stream] if you need to.
  /// You can also freely define parameters on this method.
  @override
  int build() => 0;

  void increment() => state++;
}

// function-based
class FuncCounter extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increase() {
    state++;
  }
}

final funcCounter = NotifierProvider<FuncCounter, int>(FuncCounter.new);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(funcCounter);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(funcCounter.notifier).increase(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
