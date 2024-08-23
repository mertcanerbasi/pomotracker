// Flutter imports:
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isDispose = false;
  bool isLoading = false;

  @override
  void dispose() {
    _isDispose = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_isDispose) {
      super.notifyListeners();
    }
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
