import 'package:flutter/material.dart';
import 'package:flutterfire_samples/controllers/utils/scaffold_messanger_controller.dart';
import 'package:provider/provider.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({Key? key}) : super(key: key);

  static const path = '/fouth/';
  static const name = 'FourthPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FourthPage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<ScaffoldMessengerController>().showSnackBar('Hello from FourthPage.');
              },
              child: const Text('Show SnackBar'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.popUntil(context, (route) => route.isFirst);
                await context.read<ScaffoldMessengerController>().showAlertDialog(
                      title: const Text('Alert when popping back from FourthPage'),
                      content: const Text('FourthPage から HomePage に戻るときに表示するアラートダイアログです。'),
                    );
              },
              child: const Text('Pop until HomePage'),
            ),
          ],
        ),
      ),
    );
  }
}
