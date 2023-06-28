import 'package:flutter/material.dart';
import '../../widgets/main_drawer.dart';

class PaintScreen extends StatefulWidget {
  const PaintScreen({super.key, required this.title});

  final String title;

  @override
  State<PaintScreen> createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: const MainDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const Row(
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
      ),
    );
  }
}
