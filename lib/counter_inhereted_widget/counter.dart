import 'package:flutter/material.dart';

class Counter extends InheritedWidget {
  final int count;

  const Counter({
    Key? key,
    required this.count,
    required Widget child,
  }) : super(key: key, child: child);

  static Counter of(BuildContext context) {
    final Counter? counter =
        context.dependOnInheritedWidgetOfExactType<Counter>();
    assert(counter != null, 'No Counter found in context');
    return counter!;
  }

  @override
  bool updateShouldNotify(Counter oldWidget) {
    return oldWidget.count != count;
  }
}
