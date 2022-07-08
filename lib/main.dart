import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/baemin/baemin_main_screen.dart';
import 'package:flutter_pr_guide/chat/chat_main_screen.dart';
import 'package:flutter_pr_guide/component_exam/component_exam.dart';

// 화이팅
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BaeminMainScreen(),
    );
  }
}