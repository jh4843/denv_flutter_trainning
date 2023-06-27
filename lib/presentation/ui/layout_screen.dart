import 'package:flutter/material.dart';
import '../widgets/denv_drawer.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key, required this.title});

  final String title;

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: const DenvDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Row Test',
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
          ],
        ),
      ),
    );
  }
}
