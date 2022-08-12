import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:prisavelo_ui/InitialPages/Base.dart';
import 'package:prisavelo_ui/MainPages/ChatList.dart';
import 'package:prisavelo_ui/MainPages/Search.dart';
import 'package:prisavelo_ui/MainPages/FindCourse.dart';
import 'package:prisavelo_ui/MainPages/mainPage.dart';
import 'package:prisavelo_ui/MainPages/Profile.dart';
import 'package:prisavelo_ui/MainPages/Switch.dart';
import 'package:prisavelo_ui/MainPages/AddCourse.dart';
import 'package:prisavelo_ui/MainPages/CommonLayout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Search(),
    );
  }
}
//#fff9eb