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
  bool isLoading = false;

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
        child: _buildText(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increase,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildText() {
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    return Text(
      '$count',
      style: const TextStyle(fontSize: 80),
    );
  }

  Future<void> increase() async {
    setState(() {
      isLoading = true;
    });
    print('click');

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      count++;
      isLoading = false;
    });
  }
}
