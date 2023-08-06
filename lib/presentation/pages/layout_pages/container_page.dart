import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gap/gap.dart';

// explain container layout widget in flutter
// https://flutter.dev/docs/development/ui/layout#container

class ContainerPage extends StatefulHookConsumerWidget {
  const ContainerPage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends ConsumerState<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    double x = 0;
    double y = 0;
    double z = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //drawer: const MainDrawer(),
      body: Container(
          padding: const EdgeInsets.all(50),
          margin: const EdgeInsets.all(20),
          // Box Decoration
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
            // border: const Border(
            //   top: BorderSide(
            //       width: 3.0, color: Colors.black, style: BorderStyle.solid),
            //   left: BorderSide(
            //       width: 4.0, color: Colors.green, style: BorderStyle.solid),
            //   right: BorderSide(
            //       width: 5.0, color: Colors.blue, style: BorderStyle.solid),
            //   bottom: BorderSide(
            //       width: 6.0, color: Colors.red, style: BorderStyle.none),
            // ),
          ),
          child: Column(
            children: [
              // add Container widget expanded full width and height is 40% of this widget
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.yellow,
                foregroundDecoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.4),
                  border: const Border.symmetric(
                    horizontal: BorderSide.none,
                    vertical: BorderSide(width: 5, color: Colors.black45),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Center(
                child: Transform(
                  transform: Matrix4(
                    1,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                    0,
                    0,
                    0,
                    1,
                  )
                    ..rotateX(x)
                    ..rotateY(y)
                    ..rotateZ(z),
                  alignment: FractionalOffset.center,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(
                        () {
                          y = y - details.delta.dx / 100;
                          x = x + details.delta.dy / 100;
                        },
                      );
                    },
                    child: Container(
                      color: Colors.red,
                      height: 100.0,
                      width: 100.0,
                    ),
                  ),
                ),
              ),
              const Gap(20), // add gap between widgets
              // padding, margin
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
                margin: const EdgeInsets.fromLTRB(10, 30, 20, 40),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.bottomLeft,
                foregroundDecoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.4),
                  border: Border.all(
                    width: 5,
                    color: Colors.black45,
                  ),
                ),
                child: const Text(
                  'Container',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
