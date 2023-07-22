import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_app/main.dart';

class TimerNotifier extends StateNotifier<int> {
  TimerNotifier() : super(60);

  Timer? _timer;
  int? _remainingTime;
  bool isTimerActive = false;

  void startTimer() {
    _timer?.cancel();
    isTimerActive = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state > 0) {
        state = state - 1;
      } else {
        _timer?.cancel();
        _timer = null;
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    state = 60;
    isTimerActive = false;
  }

  void pauseTimer() {
    _remainingTime = state;
    _timer?.cancel();
  }

  void resumeTimer() {
    if (_remainingTime != null) {
      state = _remainingTime!;
      startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
