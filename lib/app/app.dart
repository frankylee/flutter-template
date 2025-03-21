import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/app/l10n/flutter_template_l10n.dart';
import 'package:flutter_template/app/router/app_router.dart';
import 'package:flutter_template/app/theme/app_theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveApp(
      builder:
          (context) => MaterialApp.router(
            title: 'Flutter Demo Home Page',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            locale: const Locale('en'),
            localizationsDelegates: const [
              FlutterTemplateL10n.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            supportedLocales: FlutterTemplateL10n.supportedLocales,
            routerConfig: appRouter,
          ),
    );
  }
}
