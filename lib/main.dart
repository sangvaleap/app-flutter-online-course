import 'package:flutter/material.dart';
import 'screens/root_app.dart';
import 'theme/color.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Course App',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: RootApp(),
    );
  }

}