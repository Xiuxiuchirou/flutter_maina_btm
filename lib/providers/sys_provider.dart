import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
class PartialConsumeComponent<T extends ChangeNotifier> extends StatefulWidget {

  final T model;
  final Widget child;
  final ValueWidgetBuilder<T> builder;

  PartialConsumeComponent({
    Key key,
    @required this.model,
    @required this.builder,
    this.child
  }) : super(key: key);

  @override
  _PartialConsumeComponentState<T> createState() => _PartialConsumeComponentState<T>();

}

class _PartialConsumeComponentState<T extends ChangeNotifier> extends State<PartialConsumeComponent<T>> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: widget.model,
      child: Consumer<T>(
          builder: widget.builder,
          child: widget.child,
      ),
    );
  }
}

class CounteDownTimeProvider with ChangeNotifier {
  final int timeMax;
  final int interval;
  int _time;
  Timer _timer;

  CounteDownTimeProvider(this.timeMax, this.interval) {
    _time = timeMax;
  }

  void startCounterDown() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    _timer = Timer.periodic(Duration(seconds: interval), (timer) {
      if (timer.tick == timeMax) {
        _time = timeMax;
        timer.cancel();
        timer = null;
      } else {
        _time--;
      }
      notifyListeners();
    });
  }

  void cancel() {
    if (_timer != null) {
      _timer.cancel();
      _time = null;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }
}
