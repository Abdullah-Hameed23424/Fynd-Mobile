import 'dart:async';

import 'package:flutter/foundation.dart';

class CustomTimer {
  Timer? _timer;
  final ValueNotifier<int> remainingSeconds;
  bool get isExpired => remainingSeconds.value <= 0;
  CustomTimer({int initialSeconds = 59})
    : remainingSeconds = ValueNotifier<int>(initialSeconds);

  void start(int seconds) {
    cancel();
    remainingSeconds.value = seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value <= 0) {
        cancel();
        return;
      }

      remainingSeconds.value--;
    });
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    cancel();
    remainingSeconds.dispose();
  }
}
