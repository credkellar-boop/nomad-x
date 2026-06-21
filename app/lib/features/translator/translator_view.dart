import 'package:flutter/material.dart';
import '../../core/api_client.dart';

class TranslatorView extends StatefulWidget {
  const TranslatorView({super.key});

  @override
  State<TranslatorView> createState() => _TranslatorViewState();
}

class _TranslatorViewState extends State<TranslatorView> {
  final TextEditingController _inputController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  
  String _translatedText = '';
  bool _isLoading = false;

  Future<void> _handleTranslation() async {
    if (_inputController.text.isEmpty) return;

    setState(() => _isLoading = true);
    
    try {
      final result = await _apiClient.translateText(
        _inputController.text, 
        'Spanish', // Defaulting for the stub
      );
      setState(() => _translatedText = result);
    } catch (e) {
      setState(() => _translatedText = 'Error: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nomad-X Engine'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _inputController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Enter text to process...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _handleTranslation,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
              child: _isLoading 
                  ? const CircularProgressIndicator() 
                  : const Text('Execute Translation'),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white24),
              ),
              minHeight: 100,
              child: Text(
                _translatedText.isEmpty ? 'Output will appear here.' : _translatedText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
