import 'package:flutter/material.dart';
import 'package:prisavelo_ui/InitialPages/Base.dart';
import 'package:prisavelo_ui/MainPages/ChatList.dart';
import 'package:prisavelo_ui/MainPages/mainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Base(),
    );
  }
}
//#fff9eb