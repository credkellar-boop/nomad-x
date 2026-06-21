import 'dart:async';
import 'package:flutter/material.dart';

class MetricsProvider with ChangeNotifier {
  String _latestBlock = '0x000000';
  bool _isBackendOnline = true;
  Timer? _pollingTimer;

  String get latestBlock => _latestBlock;
  bool get isBackendOnline => _isBackendOnline;

  void initializeTelemetryStream() {
    // Poll telemetry vectors at 3-second intervals matching typical block validation speeds
    _pollingTimer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await _fetchLatestSystemState();
    });
  }

  Future<void> _fetchLatestSystemState() async {
    // Simulated real-time state change tracker from server metrics
    final simulatedHexBlock = (15632000 + (DateTime.now().second ~/ 3)).toRadixString(16).toUpperCase();
    _latestBlock = '0x$simulatedHexBlock';
    _isBackendOnline = true;
    notifyListeners();
  }

  @override
  void dispose() {
    _pollingTimer?.cancel();
    super.dispose();
  }
}
