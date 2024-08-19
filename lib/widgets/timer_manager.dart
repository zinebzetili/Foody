// timer_manager.dart

import 'dart:async';

class TimerManager {
  late Timer _timer;
  late Function(int, int) _onTick;

  TimerManager({required Function(int, int) onTick, int initialMinutes = 3, int initialSeconds = 0}) {
    _onTick = onTick;
    _startTimer(initialMinutes, initialSeconds);
  }

  void _startTimer(int initialMinutes, int initialSeconds) {
    int totalSeconds = initialMinutes * 60 + initialSeconds;
    
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int minutes = totalSeconds ~/ 60;
      int seconds = totalSeconds % 60;
      _onTick(minutes, seconds);

      if (totalSeconds == 0) {
        timer.cancel();
      } else {
        totalSeconds--;
      }
    });
  }

  void dispose() {
    _timer.cancel();
  }
}
