// sample page for exmple of freezed package

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_page.freezed.dart';

@freezed
abstract class FreezedPage with _$FreezedPage {
  const factory FreezedPage({
    required String title,
    required String description,
  }) = _FreezedPage;
}

class FreezedPageExample extends StatelessWidget {
  const FreezedPageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freezed Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Freezed Page',
            ),
          ],
        ),
      ),
    );
  }
}
