import 'package:flutter/material.dart';
import '../../shared/widgets/terminal_text.dart';

class TelemetryPanel extends StatelessWidget {
  /// Real-time sliding window display of backend AI routing and token usage.
  const TelemetryPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF080808),
        border: Border.all(color: Colors.white24),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TerminalText('LIVE TELEMETRY STREAM', fontWeight: FontWeight.bold),
          Divider(color: Colors.white24, height: 24),
          _TelemetryRow(label: 'ACTIVE ENGINE', value: 'GEMINI-PRO'),
          _TelemetryRow(label: 'NODE LATENCY', value: '42ms'),
          _TelemetryRow(label: 'HOURLY TXN VOL', value: '1,492'),
          _TelemetryRow(label: 'CACHE HIT RATE', value: '88.4%'),
        ],
      ),
    );
  }
}

class _TelemetryRow extends StatelessWidget {
  final String label;
  final String value;

  const _TelemetryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TerminalText(label, color: Colors.white54, fontSize: 12),
          TerminalText(value, fontWeight: FontWeight.bold, fontSize: 12),
        ],
      ),
    );
  }
}
