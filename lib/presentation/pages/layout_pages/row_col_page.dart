import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../widgets/main_drawer.dart';

class RowColPage extends ConsumerWidget {
  final String title;

  const RowColPage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      drawer: const MainDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Column Layout(MainAxisAlignment: spaceEvenly)',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.emoji_emotions),
                Text(
                  'Row Layout(MainAxisAlignment: spaceEvenly)',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.star, color: Colors.red),
                    Icon(Icons.star, color: Colors.blue),
                    Icon(Icons.star, color: Colors.green),
                    Icon(Icons.star, color: Colors.black),
                    Icon(Icons.star, color: Colors.black),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.emoji_emotions),
                Text(
                  'Row Layout(MainAxisAlignment: start)',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.red),
                    Icon(Icons.star, color: Colors.blue),
                    Icon(Icons.star, color: Colors.green),
                    Icon(Icons.star, color: Colors.black),
                    Icon(Icons.star, color: Colors.black),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.emoji_emotions),
                Text(
                  'Row Layout(MainAxisAlignment: center)',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.red),
                    Icon(Icons.star, color: Colors.blue),
                    Icon(Icons.star, color: Colors.green),
                    Icon(Icons.star, color: Colors.black),
                    Icon(Icons.star, color: Colors.black),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.emoji_emotions),
                Expanded(
                  child: Center(
                    child: Text(
                      'Row Layout(MainAxisAlignment: center - Expanded - Center)',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.5,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.red),
                    Icon(Icons.star, color: Colors.blue),
                    Icon(Icons.star, color: Colors.green),
                    Icon(Icons.star, color: Colors.black),
                    Icon(Icons.star, color: Colors.black),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
