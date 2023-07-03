import 'package:flutter/material.dart';
import '../../widgets/main_drawer.dart';

class PaintPage extends StatefulWidget {
  const PaintPage({super.key, required this.title});

  final String title;

  @override
  State<PaintPage> createState() => _PaintPageState();
}

class _PaintPageState extends State<PaintPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.folder_open),
              )
            ],
          ),
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
      ),
    );
  }
}
