import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/counter_inhereted_widget/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterInheritedWidgetSample extends StatelessWidget {
  const CounterInheritedWidgetSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CounterViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('카운터'),
      ),
      body: Center(
        child: Text(
          '${viewModel.count}',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
