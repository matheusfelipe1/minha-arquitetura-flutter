import 'package:flutter/material.dart';

class MemoryObserver extends WidgetsBindingObserver {
  @override
  void didHaveMemoryPressure() {
    // TODO: implement didHaveMemoryPressure
    super.didHaveMemoryPressure();
    print("Memory runnig low");
  }
}