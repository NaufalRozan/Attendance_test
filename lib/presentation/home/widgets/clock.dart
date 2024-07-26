import 'dart:async';

import 'package:attendance_test/core/constants/colors.dart';
import 'package:attendance_test/core/core.dart';
import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key}) : super(key: key);

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  DateTime _currentTime = DateTime.now();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _currentTime.toFormattedTime(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
            color: AppColors.primary,
          ),
        ),
        Text(
          _currentTime.toFormattedDate(),
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
