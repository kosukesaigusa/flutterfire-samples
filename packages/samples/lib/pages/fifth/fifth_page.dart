import 'package:flutter/material.dart';
import 'package:flutterfire_samples/pages/animation/animation_page.dart';

class FifthPage extends StatelessWidget {
  const FifthPage({Key? key}) : super(key: key);

  static const path = '/fifth/';
  static const name = 'FifthPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FifthPage')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // await Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   AnimationPage.path,
            //   (route) => route.isFirst,
            // );
            await Navigator.pushNamed(context, AnimationPage.path);
          },
          child: const Text('Show Animation and go back to HomePage'),
        ),
      ),
    );
  }
}
