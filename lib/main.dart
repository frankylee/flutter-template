import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/app/app.dart';
import 'package:flutter_template/app/toggle/app_toggles.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  // Initialize the feature toggles.
  await AppToggles.init();
  // Build app with Riverpod.
  runApp(const ProviderScope(child: MyApp()));
}
