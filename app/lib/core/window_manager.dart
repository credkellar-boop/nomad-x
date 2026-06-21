import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

class DesktopWindowManager {
  /// Enforces strict window geometry for macOS and Windows deployment.
  /// Prevents the application from being resized into non-optimal ratios.
  
  static void initialize() {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      setWindowTitle('Nomad-X Enterprise Terminal');
      setWindowMinSize(const Size(1024, 768));
      setWindowMaxSize(const Size(2560, 1440));
      
      // Default to a focused, wide dashboard layout
      setWindowFrame(const Rect.fromLTWH(100, 100, 1280, 800));
    }
  }
}
