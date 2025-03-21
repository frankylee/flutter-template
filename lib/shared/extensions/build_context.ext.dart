import 'package:flutter/material.dart';
import 'package:flutter_template/app/l10n/flutter_template_l10n.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExt on BuildContext {
  ColorScheme get colorTheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  FlutterTemplateL10n get l10n => FlutterTemplateL10n.of(this)!;

  String? get goRouterLocation => GoRouterState.of(this).uri.toString();
}
