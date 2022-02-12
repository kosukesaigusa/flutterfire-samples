import 'package:flutter/material.dart';
import 'package:flutterfire_samples/controllers/utils/scaffold_messanger_controller.dart';
import 'package:flutterfire_samples/pages/fourth/foruth_page.dart';
import 'package:provider/provider.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  static const path = '/third/';
  static const name = 'ThirdPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ThirdPage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<ScaffoldMessengerController>().showSnackBar('Hello from ThirdPage.');
              },
              child: const Text('Show SnackBar'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.pushNamed<void>(context, FourthPage.path);
              },
              child: const Text('Go to FourthPage'),
            ),
          ],
        ),
      ),
    );
  }
}
