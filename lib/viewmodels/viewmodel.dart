import 'dart:developer';

import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  bool _loading = false;
  String _error = "";

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  void setError(String error, StackTrace stackTrace) {
    _error = error;
    log(error, stackTrace: stackTrace);
  }

  bool get loading => _loading;

  String get error => _error;
}