import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/app/app.dart';
import 'package:flutter_template/shared/app_version/app_update_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../shared/app_version/app_update_provider.dart';

void main() {
  group('App Update Page', () {
    group('Hard app update required', () {
      testWidgets('does not show close action in app bar', (
        WidgetTester tester,
      ) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              AppUpdateNotifier.provider.overrideWith(
                () => AppUpdateNotifierMock(returnValue: AppUpdate.hardUpdate),
              ),
            ],
            child: const MyApp(),
          ),
        );

        // Verify that the close icon is not present.
        expect(find.byIcon(Icons.close), findsNothing);
      });
    });

    group('Soft app update available', () {
      testWidgets('shows close action in app bar', (
        WidgetTester tester,
      ) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              AppUpdateNotifier.provider.overrideWith(
                () => AppUpdateNotifierMock(returnValue: AppUpdate.softUpdate),
              ),
            ],
            child: const MyApp(),
          ),
        );

        // Verify that the close icon is present.
        expect(find.byIcon(Icons.close), findsOneWidget);
      });
    });
  });
}
