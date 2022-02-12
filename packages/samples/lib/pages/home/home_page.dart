import 'package:flutter/material.dart';
import 'package:flutterfire_samples/controllers/utils/scaffold_messanger_controller.dart';
import 'package:flutterfire_samples/pages/second/second_page.dart';
import 'package:flutterfire_samples/pages/third/third_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const path = '/';
  static const name = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () async {
                await context.read<ScaffoldMessengerController>().showAlertDialog(
                      title: const Text('Alert from HomePage'),
                      content: const Text('HomePage から表示するアラートダイアログです。'),
                    );
              },
              child: const Text('Show Alert Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ScaffoldMessengerController>().showSnackBar('Hello from HomePage.');
              },
              child: const Text('Show SnackBar'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.pushNamed<void>(context, SecondPage.path);
                await context.read<ScaffoldMessengerController>().showAlertDialog(
                      title: const Text('Alert when popping back from SecondPage'),
                      content: const Text('SecondPage から HomePage に戻るときに表示するアラートダイアログです。'),
                    );
              },
              child: const Text('Go to SecondPage'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.pushNamed<void>(context, ThirdPage.path);
              },
              child: const Text('Go to ThirdPage'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
