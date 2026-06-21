import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/translator/translator_view.dart';

void main() {
  runApp(const NomadXApp());
}

class NomadXApp extends StatelessWidget {
  const NomadXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nomad-X',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F172A),
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
      ),
      home: const TranslatorView(),
    );
  }
}
