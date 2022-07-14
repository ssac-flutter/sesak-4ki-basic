import 'package:flutter/material.dart';

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
      home: const CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카운터'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                count--;
              });
            },
            icon: const Icon(Icons.exposure_minus_1),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                count = count - 2;
              });
            },
            icon: const Icon(Icons.exposure_minus_2),
          ),
        ],
      ),
      body: Center(
        child: Text(
          '$count',
          style: const TextStyle(fontSize: 80),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print('click');

          setState(() {
            count++;
          });
        },
      ),
    );
  }
}
