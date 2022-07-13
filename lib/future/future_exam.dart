import 'package:flutter/material.dart';

class FutureExam extends StatelessWidget {
  const FutureExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future 연습'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print('시작!!!');

            exam1();
          },
          child: const Text('연습 1'),
        ),
      ),
    );
  }

  Future exam1() async {
    var delay = Future.delayed(Duration(seconds: 3));
    delay.then((value) => print('Hello'));
  }
}
