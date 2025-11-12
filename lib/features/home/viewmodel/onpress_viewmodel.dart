import 'dart:async';
import 'package:flutter/material.dart';

class OnPressViewModel {
  void navigateAfterDelay(BuildContext context, Widget nextScreen) {
    Timer(const Duration(milliseconds: 100), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => nextScreen),
      );
    });
  }
}
