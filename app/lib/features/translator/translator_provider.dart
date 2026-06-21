import 'package:flutter/material.dart';
import '../../core/api_client.dart';

class TranslatorProvider with ChangeNotifier {
  final ApiClient _apiClient;

  TranslatorProvider({required ApiClient apiClient}) : _apiClient = apiClient;

  String _outputPayload = '';
  bool _isProcessing = false;
  String _activeLanguage = 'Spanish';

  String get outputPayload => _outputPayload;
  bool get isProcessing => _isProcessing;
  String get activeLanguage => _activeLanguage;

  void setLanguage(String lang) {
    if (_activeLanguage == lang) return;
    _activeLanguage = lang;
    notifyListeners();
  }

  Future<void> dispatchTranslationPipeline(String text) async {
    if (text.trim().isEmpty) return;

    _isProcessing = true;
    _outputPayload = 'Initiating translation sequence...';
    notifyListeners();

    try {
      _outputPayload = await _apiClient.translateText(text, _activeLanguage);
    } catch (error) {
      _outputPayload = 'Pipeline Failure: ${error.toString()}';
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }
}
