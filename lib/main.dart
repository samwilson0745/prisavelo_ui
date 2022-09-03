import 'package:flutter/material.dart';
import 'package:prisavelo_ui/InitialPages/Base.dart';
import 'package:prisavelo_ui/MainPages/ChatList.dart';
import 'package:prisavelo_ui/MainPages/FindCourse.dart';
import 'package:prisavelo_ui/MainPages/mainPage.dart';
import 'package:prisavelo_ui/MainPages/Profile.dart';
import 'package:prisavelo_ui/MainPages/Switch.dart';
import 'package:prisavelo_ui/MainPages/AddCourse.dart';
import 'package:prisavelo_ui/MainPages/Explore.dart';
import 'package:prisavelo_ui/MainPages/Video.dart';
import 'package:prisavelo_ui/Professional/MakeCourse.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoApp("https://firebasestorage.googleapis.com/v0/b/prisavelo-7a2f8.appspot.com/o/course%2Ff7PZMdcTVXdk69d8JZNxBq7cDhE2%2F01199587-3ff3-4bfc-90dd-82bca242cc00_1.mp4?alt=media&token=95291df0-4604-4343-a561-9a0f4a772120",),
    );
  }
}
//#fff9eb