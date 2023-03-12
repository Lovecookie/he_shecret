import 'package:flutter/material.dart';
import 'package:shipcret/common/common_font.dart';
import 'package:shipcret/material-theme/common_color.dart';
import 'package:shipcret/widgets/common/common_string.dart';

class FCountDownTextWidget extends StatefulWidget {
  final DateTime expiredDateTime;

  const FCountDownTextWidget({super.key, required this.expiredDateTime});

  @override
  State<FCountDownTextWidget> createState() => _FCountDownTextWidgetState();
}

class _FCountDownTextWidgetState extends State<FCountDownTextWidget> {
  late DateTime _startDateTime;
  late int _countDownTime;

  @override
  void initState() {
    super.initState();
    _startDateTime = DateTime.now();
    _countDownTime = widget.expiredDateTime.difference(_startDateTime).inSeconds;
    if (_countDownTime <= 0) {
      _countDownTime = 0;
    }

    _startCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return _remainedTimeText();
  }

  void _startCountDown() {
    Future<void>.delayed(const Duration(seconds: 1), () {
      _countDownTime--;
      if (_countDownTime < 0) {
        return;
      }

      if (mounted) {
        setState(() {});
      }

      _startCountDown();
    });
  }

  Widget _remainedTimeText() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        '${FCommonString.remainedTime} : $_countDownTime',
        style: const TextStyle(
          color: FCommonColor.subPrimaryWhite,
          fontFamily: FCommonFont.family,
          fontSize: 12.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
