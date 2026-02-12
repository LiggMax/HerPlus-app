import 'package:flutter/material.dart';
import 'package:herplus/core/utils/nav_utils.dart';
import 'package:herplus/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(navigatorKey: NavUtils.navigatorKey, home: HomePage());
  }
}
