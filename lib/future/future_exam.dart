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
          onPressed: () async {
            print('시작!!!');

            String result = await exam1_3();
            print(result);
          },
          child: const Text('연습 1'),
        ),
      ),
    );
  }

  Future exam1() async {
    var delay = Future.delayed(const Duration(seconds: 3));
    delay.then((value) => print('Hello'));
  }

  Future<String> exam1_2() async {
    await Future.delayed(const Duration(seconds: 2));
    var data = await Future.value('Hello');
    return data;
  }

  Future<String> exam1_3() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Hello';
  }
}
