import 'package:flutter/material.dart';
import 'package:prisavelo_ui/InitialPages/Base.dart';
import 'package:prisavelo_ui/MainPages/ChatList.dart';
import 'package:prisavelo_ui/MainPages/mainPage.dart';
import 'package:prisavelo_ui/MainPages/Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Profile(),
    );
  }
}
//#fff9eb