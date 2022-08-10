import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/counter_inhereted_widget/counter.dart';
import 'package:flutter_pr_guide/counter_inhereted_widget/next_screen.dart';

class CounterInheritedWidgetSample extends StatelessWidget {
  const CounterInheritedWidgetSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = Counter.of(context).count;

    return Scaffold(
      appBar: AppBar(
        title: const Text('카운터'),
      ),
      body: Center(
        child: Text(
          '$count',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NextScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
