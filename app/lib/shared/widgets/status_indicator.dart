import 'package:flutter/material.dart';
import 'terminal_text.dart';

class StatusIndicator extends StatelessWidget {
  final String label;
  final bool isOperational;

  /// Universal indicator for AI Router and Monad Node statuses.
  const StatusIndicator({
    super.key,
    required this.label,
    required this.isOperational,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isOperational ? Colors.greenAccent : Colors.redAccent,
            boxShadow: [
              BoxShadow(
                color: isOperational ? Colors.greenAccent.withOpacity(0.5) : Colors.redAccent.withOpacity(0.5),
                blurRadius: 6,
                spreadRadius: 2,
              )
            ],
          ),
        ),
        const SizedBox(width: 12),
        TerminalText(
          label,
          color: isOperational ? Colors.white : Colors.white54,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
