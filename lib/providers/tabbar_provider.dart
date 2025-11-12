import 'package:flutter/material.dart';

class TabBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  bool _isExpanded = false;

  int get selectedIndex => _selectedIndex;
  bool get isExpanded => _isExpanded;

  void selectTab(int index, ValueChanged<bool>? onExpandChanged) {
    _selectedIndex = index;
    _isExpanded = index == 0;
    onExpandChanged?.call(_isExpanded);
    notifyListeners();
  }

  void collapseTabBar(ValueChanged<bool>? onExpandChanged) {
    _isExpanded = false;
    _selectedIndex = 1;
    onExpandChanged?.call(_isExpanded);
    notifyListeners();
  }

  bool isTabSelected(int index) {
    return _selectedIndex == index;
  }

  double getContainerHeight(double expandedHeight, double collapsedHeight) {
    return _isExpanded ? expandedHeight : collapsedHeight;
  }

  double getContentOpacity() {
    return _isExpanded ? 1.0 : 0.0;
  }
}