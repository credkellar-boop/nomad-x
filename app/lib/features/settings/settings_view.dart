import 'package:flutter/material.dart';
import '../../shared/widgets/terminal_text.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SYSTEM CONFIGURATION'),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.white24, height: 1.0),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const TerminalText('OMNI-AI ROUTER PRIORITIES', fontSize: 16, fontWeight: FontWeight.bold),
          const SizedBox(height: 16),
          _buildConfigSwitch('Gemini Primary Engine', true),
          _buildConfigSwitch('GPT-4 Fallback', true),
          _buildConfigSwitch('Claude 3 Opus Integration', false),
          _buildConfigSwitch('Grok Raw Data Feed', true),
          const Divider(height: 48, color: Colors.white24),
          const TerminalText('MONAD HFT NODE', fontSize: 16, fontWeight: FontWeight.bold),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: 'https://rpc.monad.xyz',
            decoration: const InputDecoration(labelText: 'RPC Endpoint URL'),
          ),
        ],
      ),
    );
  }

  Widget _buildConfigSwitch(String title, bool initialValue) {
    return SwitchListTile(
      title: TerminalText(title),
      value: initialValue,
      activeColor: Colors.black,
      activeTrackColor: Colors.white,
      inactiveThumbColor: Colors.white54,
      inactiveTrackColor: const Color(0xFF1A1A1A),
      onChanged: (bool value) {
        // Toggle logic injected via Provider
      },
    );
  }
}
