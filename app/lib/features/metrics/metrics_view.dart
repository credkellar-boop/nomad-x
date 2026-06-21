import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'metrics_provider.dart';

class MetricsView extends StatelessWidget {
  const MetricsView({super.key});

  @override
  Widget build(BuildContext context) {
    final metricsProvider = context.watch<MetricsProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'SYSTEM TELEMETRY ENGINE',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontFamily: 'IBMPlexMono',
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _MetricCard(
                    title: 'MONAD BLOCK HEIGHT',
                    value: metricsProvider.latestBlock,
                    icon: Icons.grid_view,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _MetricCard(
                    title: 'ROUTER UPTIME STATUS',
                    value: metricsProvider.isBackendOnline ? '100% OPERATIONAL' : 'OFFLINE',
                    color: metricsProvider.isBackendOnline ? Colors.green : Colors.red,
                    icon: Icons.bolt,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? color;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.white54),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.white54, letterSpacing: 1.2)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color ?? Colors.white, fontFamily: 'IBMPlexMono')),
        ],
      ),
    );
  }
}
