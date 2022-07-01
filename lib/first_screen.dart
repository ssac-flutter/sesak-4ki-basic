// stless
import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // 상태
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (text) {
                  name = text;
                  print(text);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 버튼 클릭시 화면이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen(name)),
                );
              },
              child: Text('다음 화면으로'),
            ),
          ],
        ),
      ),
    );
  }
}
