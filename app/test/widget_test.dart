import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nomad_x/main.dart';

void main() {
  testWidgets('System architecture bootstrap validation test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const NomadXApp());

    // Verify workspace layout initializes using the dark design theme configuration
    final materialAppFinder = find.byType(MaterialApp);
    expect(materialAppFinder, findsOneWidget);

    final MaterialApp app = tester.widget(materialAppFinder);
    expect(app.theme?.brightness, Brightness.dark);
  });
}
