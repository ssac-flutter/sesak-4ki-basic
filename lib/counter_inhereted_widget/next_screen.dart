import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/counter_inhereted_widget/counter.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Counter.of(context).count}'),
      ),
      body: Container(),
    );
  }
}
