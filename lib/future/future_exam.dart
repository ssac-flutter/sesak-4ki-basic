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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                print('시작!!!');

                String result = await exam1_3();
                print(result);
              },
              child: const Text('연습 1'),
            ),
            ElevatedButton(
              onPressed: () async {
                // 1초 대기
                for (int i = 0; i < 3; i++) {
                  await Future.delayed(const Duration(seconds: 1));
                  print('Hello');
                }
              },
              child: const Text('연습 2'),
            ),
            ElevatedButton(
              onPressed: exam3,
              child: const Text('연습 3'),
            ),
            ElevatedButton(
              onPressed: exam4,
              child: const Text('연습 4'),
            ),
          ],
        ),
      ),
    );
  }

  Future exam4() async {
    print('5');
    await Future.delayed(const Duration(seconds: 1));
    print('4');
    await Future.delayed(const Duration(seconds: 1));
    print('3');
    await Future.delayed(const Duration(seconds: 1));
    print('2');
    await Future.delayed(const Duration(seconds: 1));
    print('1');
  }

  Future exam3() async {
    print('다운로드 시작!');
    await Future.delayed(const Duration(seconds: 1));

    print('초기화 중..');
    await Future.delayed(const Duration(seconds: 1));

    print('핵심파일 로드 중..');
    await Future.delayed(const Duration(seconds: 3));

    print('다운로드 완료!');
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
