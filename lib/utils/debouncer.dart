import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({required int delayMilliseconds}) : delay = Duration(milliseconds: delayMilliseconds);

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(delay, action);
  }
}
