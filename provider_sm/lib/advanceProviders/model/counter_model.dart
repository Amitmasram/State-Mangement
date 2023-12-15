import 'package:flutter/foundation.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;
  int _multiplier = 1;

  int get count => _count;
  int get multiplier => _multiplier;

  void increment() {
    _count++;
    notifyListeners();
  }

  void setMultiplier(int value) {
    _multiplier = value;
    notifyListeners();
  }
}
