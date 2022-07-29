import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/counter_stream/counter_api.dart';

class CounterStreamApp extends StatefulWidget {
  const CounterStreamApp({Key? key}) : super(key: key);

  @override
  State<CounterStreamApp> createState() => _CounterStreamAppState();
}

class _CounterStreamAppState extends State<CounterStreamApp> {
  final _api = CounterApi();

  int _count = 0;

  StreamSubscription<int>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = _api.countStream.listen((count) {
      setState(() {
        _count = count;
      });
    });
  }

  @override
  void dispose() {
    // if (_subscription != null) {
    //   _subscription!.cancel();
    // }
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카운터 Stream 버전'),
      ),
      body: Center(
        child: Text(
          '$_count',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _api.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
