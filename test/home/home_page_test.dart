// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/app/app.dart';
import 'package:flutter_template/shared/app_version/app_update_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../shared/app_version/app_update_provider.dart';

void main() {
  group('Home Page', () {
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            AppUpdateNotifier.provider.overrideWith(
              () => AppUpdateNotifierMock(returnValue: AppUpdate.current),
            ),
          ],
          child: const MyApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });
}
