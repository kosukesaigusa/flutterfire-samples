import 'package:flutter/material.dart';
import 'package:flutterfire_samples/controllers/utils/scaffold_messanger_controller.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  static const path = '/second/';
  static const name = 'SecondPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SecondPage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is SecondPage'),
            ElevatedButton(
              onPressed: () {
                context.read<ScaffoldMessengerController>().showSnackBar('Hello from SecondPage.');
              },
              child: const Text('Show SnackBar'),
            ),
          ],
        ),
      ),
    );
  }
}
