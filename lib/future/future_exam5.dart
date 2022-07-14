import 'dart:math';

import 'package:flutter/material.dart';

class FutureExam5 extends StatefulWidget {
  const FutureExam5({Key? key}) : super(key: key);

  @override
  State<FutureExam5> createState() => _FutureExam5State();
}

class _FutureExam5State extends State<FutureExam5> {
  final results = [
    '멍멍이',
    '인간',
    '고양이',
    '도마뱀',
  ];

  int _index = -1;

  bool isLoading = false;

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future 연습 5'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('당신의 전생은?'),
            _buildResult(),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });

                await getBefore();

                setState(() {
                  isLoading = false;
                });
              },
              child: const Text('클릭!!'),
            ),
          ],
        ),
      ),
    );
  }

  Future getBefore() async {
    await Future.delayed(const Duration(seconds: 3));
    _index = random.nextInt(results.length);
  }

  Widget _buildResult() {
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    if (_index == -1) {
      return const Text('');
    }
    return Text(results[_index]);
  }
}
