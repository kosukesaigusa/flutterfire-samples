import 'package:flutter/material.dart';

const devaultSnackBarBehavior = SnackBarBehavior.floating;
const defaultSnackBarDuration = Duration(seconds: 3);

class ScaffoldMessengerController<T> {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  /// アラートダイアログを表示する
  Future<T?> showAlertDialog({
    Widget? title,
    Widget? content,
    List<Widget>? actions,
  }) {
    return showDialog<T>(
      context: scaffoldMessengerKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: title,
          content: content,
          actions: actions,
        );
      },
    );
  }

  /// スナックバーを表示する
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message, {
    bool removeCurrentSnackabar = true,
    Duration duration = defaultSnackBarDuration,
  }) {
    if (removeCurrentSnackabar) {
      scaffoldMessengerKey.currentState!.removeCurrentSnackBar();
    }
    return scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
      behavior: devaultSnackBarBehavior,
      duration: duration,
    ));
  }
}
