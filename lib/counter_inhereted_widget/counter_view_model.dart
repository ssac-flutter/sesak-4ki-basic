import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {
  int count = 0;
  bool isLoading = false;

  void increment() {
    isLoading = true;
    notifyListeners(); // 화면 갱신

    count++;
    notifyListeners(); // 화면 갱신

    isLoading = false;
    notifyListeners(); // 화면 갱신
  }
}
