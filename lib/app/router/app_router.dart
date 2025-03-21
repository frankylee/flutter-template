import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/app/router/app_routes.dart';
import 'package:flutter_template/pages/app_update/app_update_page.dart';
import 'package:flutter_template/pages/home/home_page.dart';
import 'package:flutter_template/shared/model/app_version/app_update_provider.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: AppRoute.home.path,
  navigatorKey: _rootNavigatorKey,
  routes: _routes,
  redirect: (context, state) async {
    // Global redirect to App Update if hard update is required. This ensures
    // that the app update is enforced for users who do not quit or relaunch
    // the application.
    final container = ProviderScope.containerOf(context);
    final appVersion = await container.read(AppUpdateNotifier.provider.future);
    if (appVersion == AppUpdate.hardUpdate) {
      return AppRoute.appUpdate.path;
    }
    return null;
  },
);

final _routes = [
  GoRoute(
    name: AppRoute.home.name,
    path: AppRoute.home.path,
    pageBuilder: (context, state) => const MaterialPage(child: MyHomePage()),
  ),
  GoRoute(
    name: AppRoute.appUpdate.name,
    path: AppRoute.appUpdate.path,
    pageBuilder:
        (context, state) => const NoTransitionPage(child: AppUpdatePage()),
  ),
];
