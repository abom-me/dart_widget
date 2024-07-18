part of '../dart_widget.dart';

class CircleLoading {
  CircleLoading._privateConstructor({required String loadingText , required String onDoneText})

      : _loadingText = loadingText,
        _onDoneText = onDoneText;


  static final CircleLoading _instance = CircleLoading._privateConstructor(
    loadingText: "Loading",
    onDoneText: "Done",
  );

  factory CircleLoading({required String loadingText , required String onDoneText}) {
    _instance._loadingText = loadingText;
    _instance._onDoneText = onDoneText;
    return _instance;
  }

  String _onDoneText;
  String _loadingText ;
   final List<String> _frames = ['🕐', '🕑', '🕒', '🕓', '🕔', '🕕', '🕖', '🕗', '🕙'];
   final List<String> _frames2 = ['','.','','...',''];
  int _index = 0;
  int _index2 = 0;
  Timer? _timer;
  bool _isRunning = false;
/// [start] method to start the spinner
  void start() {
    if (_isRunning) return; // Prevent starting if already running
    _isRunning = true;
    print('');
    _timer = Timer.periodic(Duration(milliseconds: 200), _updateCircleLoading);
  }
/// [_updateCircleLoading] method to update the spinner
  void _updateCircleLoading(Timer timer) {
    if (!_isRunning) {
      timer.cancel();
      return;
    }

    stdout.write('\r${_frames[_index]} ${_loadingText.yellow()} ${_frames2[_index2]}'.bold().green());

    _index = (_index + 1) % _frames.length;
    _index2 = (_index2 + 1) % _frames2.length;
  }

  /// [stop] method to stop the spinner
 stop() {
    if (!_isRunning) return;
    _isRunning = false;
    _timer?.cancel();
    Console().cursorUp();
    Console().eraseLine();
    print('\n✅ ${_onDoneText.green()}'.bold().green());
    stdout.write('\n');
  }
}