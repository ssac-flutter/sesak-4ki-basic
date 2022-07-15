import 'dart:convert';

import 'package:flutter/material.dart';

class JsonExam extends StatefulWidget {
  const JsonExam({Key? key}) : super(key: key);

  @override
  State<JsonExam> createState() => _JsonExamState();
}

class _JsonExamState extends State<JsonExam> {
  Map<String, dynamic>? person;

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future initData() async {
    person = await getData();

    // 화면 갱신
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON 연습'),
      ),
      body: Center(
        child: person == null
            ? const CircularProgressIndicator()
            : Text(
                '이름은 ${person!['name']}, 이메일은 ${person!['email']}',
                style: const TextStyle(fontSize: 40),
              ),
      ),
    );
  }

  Future<Map<String, dynamic>> getData() async {
    await Future.delayed(const Duration(seconds: 2));

    String jsonString = '{ "name": "홍길동", "email": "aaa@aaa.com" }';
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap;
  }
}
