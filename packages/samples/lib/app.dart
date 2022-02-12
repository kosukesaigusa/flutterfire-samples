import 'package:flutter/material.dart';
import 'package:flutterfire_samples/controllers/utils/scaffold_messanger_controller.dart';
import 'package:flutterfire_samples/pages/home/home_page.dart';
import 'package:flutterfire_samples/routes/routes.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: UniqueKey(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScaffoldMessengerNavigator(),
    );
  }
}

class ScaffoldMessengerNavigator extends StatelessWidget {
  const ScaffoldMessengerNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: context.select<ScaffoldMessengerController, Key>((c) => c.scaffoldMessengerKey),
      child: Scaffold(
        body: Navigator(
          key: context.watch<GlobalKey<NavigatorState>>(),
          initialRoute: HomePage.path,
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute<dynamic>(
              settings: routeSettings,
              builder: (context) {
                return routeBuilder[routeSettings.name]!(context);
              },
            );
          },
        ),
      ),
    );
  }
}
