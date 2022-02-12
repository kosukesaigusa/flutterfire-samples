import 'package:flutter/material.dart';
import 'package:flutterfire_samples/pages/fourth/foruth_page.dart';
import 'package:flutterfire_samples/pages/home/home_page.dart';
import 'package:flutterfire_samples/pages/second/second_page.dart';
import 'package:flutterfire_samples/pages/third/third_page.dart';

final routeBuilder = <String, Widget Function(BuildContext context)>{
  HomePage.path: (context) => const HomePage(key: ValueKey(HomePage.name)),
  SecondPage.path: (context) => const SecondPage(key: ValueKey(SecondPage.name)),
  ThirdPage.path: (context) => const ThirdPage(key: ValueKey(ThirdPage.name)),
  FourthPage.path: (context) => const FourthPage(key: ValueKey(FourthPage.name)),
};
