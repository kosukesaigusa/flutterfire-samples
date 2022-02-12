import 'package:flutter/material.dart';
import 'package:flutterfire_samples/controllers/utils/scaffold_messanger_controller.dart';
import 'package:flutterfire_samples/pages/home/home_page.dart';
import 'package:provider/provider.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  static const path = '/animation/';
  static const name = 'AnimationPage';

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _alignment;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
      lowerBound: -0.39,
      upperBound: 1.2,
    );
    _alignment = _animationController.drive(
      AlignmentTween(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
    );
    runAnimation();
  }

  /// アニメーションを実行して、HomePage に戻る
  Future<void> runAnimation() async {
    await _animationController.forward();
    // route.settings.name == HomePage.path とするか route.isFirst とするかは要件次第
    Navigator.popUntil(context, (route) => route.settings.name == HomePage.path);
    // Navigator.popUntil(context, (route) => route.isFirst);
    await context.read<ScaffoldMessengerController>().showAlertDialog(
          title: const Text('Alert when popping back after animation'),
          content: const Text('5th Page → アニメーション → HomePage と遷移した後に表示するダイアログです。'),
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlignTransition(
        alignment: _alignment,
        child: ColoredBox(
          color: Theme.of(context).colorScheme.primary,
          child: const SizedBox(
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
