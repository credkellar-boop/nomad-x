import 'package:flutter/material.dart';
import '../../core/api_client.dart';

class WalletProvider with ChangeNotifier {
  final ApiClient _apiClient;
  String _monadBalance = '0.00';
  bool _isSyncing = false;

  WalletProvider({required ApiClient apiClient}) : _apiClient = apiClient;

  String get monadBalance => _monadBalance;
  bool get isSyncing => _isSyncing;

  Future<void> syncTreasuryLedger() async {
    _isSyncing = true;
    notifyListeners();

    try {
      // In production, this pings the /api/v1/network router
      await Future.delayed(const Duration(milliseconds: 800)); 
      _monadBalance = '1,250,000.00'; // Simulated fetch
    } catch (e) {
      debugPrint('Treasury Sync Error: $e');
    } finally {
      _isSyncing = false;
      notifyListeners();
    }
  }
}
