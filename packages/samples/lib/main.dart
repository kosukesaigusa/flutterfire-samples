import 'package:flutter/material.dart';
import 'package:flutterfire_samples/app.dart';
import 'package:flutterfire_samples/controllers/utils/scaffold_messanger_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => GlobalKey<NavigatorState>()),
        Provider(create: (_) => ScaffoldMessengerController()),
      ],
      child: const App(),
    ),
  );
}
