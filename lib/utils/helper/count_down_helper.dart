import 'dart:async';

class CountDownHelper {
  Timer? _timer;

  startCountDownTimer({
    required int timeInMS,
    required void Function(int totalSeconds) currentCountDown,
    required void Function() onFinish,
  }) {
    _timer = Timer.periodic(
      const Duration(milliseconds: 1000),
      (Timer timer) {
        timeInMS -= 1000;
        Duration duration = Duration(milliseconds: timeInMS);
        currentCountDown(duration.inSeconds);
        if (duration.inSeconds == 0) {
          onFinish();
          timer.cancel();
        }
      },
    );
  }

  void cancelTimer() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }
  }
}
