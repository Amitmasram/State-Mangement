import 'package:flutter/foundation.dart';

class MultiplierModel with ChangeNotifier {
  int _multiplier = 1;

  int get multiplier => _multiplier;

  void setMultiplier(int value) {
    _multiplier = value;
    notifyListeners();
  }
}
