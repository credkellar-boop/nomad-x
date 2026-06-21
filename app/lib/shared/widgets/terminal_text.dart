import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TerminalText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  /// A strict, standardized text widget enforcing the corporate IBM Plex Mono aesthetic 
  /// across all Nomad-X interfaces. No deviations allowed.
  const TerminalText(
    this.text, {
    super.key,
    this.fontSize = 14.0,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ibmPlexMono(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: 0.5,
      ),
    );
  }
}
