import 'package:flutter/foundation.dart';

mixin ErrorHandling on ChangeNotifier {
  String? _error;
  bool _hasError = false;

  String? get error => _error;
  bool get hasError => _hasError;

  void setError(String? message) {
    _error = message;
    _hasError = message != null;
    notifyListeners();
  }

  void clearError([bool notify = true]) {
    _error = null;
    _hasError = false;
    if (notify) notifyListeners();
  }
}
