import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  double _dragPosition = 0;
  bool _isDragging = false;

  double get dragPosition => _dragPosition;
  bool get isDragging => _isDragging;

  void startDragging() {
    _isDragging = true;
    notifyListeners();
  }

  void updateDragPosition(double delta, double maxDrag) {
    _dragPosition = (_dragPosition + delta).clamp(0.0, maxDrag);
    notifyListeners();
  }

  Future<bool> endDragging(double maxDrag, VoidCallback onComplete) async {
    if (_dragPosition >= maxDrag * 0.85) {
      // Slide completed
      onComplete();

      // Reset after delay
      await Future.delayed(const Duration(milliseconds: 200));
      reset();
      return true;
    } else {
      // Snap back
      reset();
      return false;
    }
  }

  void reset() {
    _dragPosition = 0;
    _isDragging = false;
    notifyListeners();
  }

  double getOpacity(double maxDrag) {
    return 1 - (_dragPosition / maxDrag).clamp(0.0, 1.0);
  }
}