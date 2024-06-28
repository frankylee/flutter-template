import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/app/router/app_routes.dart';
import 'package:flutter_template/shared/model/app_version/app_update_provider.dart';
import 'package:flutter_template/shared/ui/app_bar/custom_app_bar.dart';
import 'package:go_router/go_router.dart';

class AppUpdatePage extends ConsumerWidget {
  const AppUpdatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The initial route loads the provider, so we know we can require the value.
    final appVersion = ref.watch(AppUpdateNotifier.provider).requireValue;
    return Scaffold(
      appBar: CustomAppBar(
        title: appVersion == AppUpdate.hardUpdate
            ? 'App Update Required'
            : 'New App Update',
        actions: [
          if (appVersion != AppUpdate.hardUpdate)
            IconButton(
              padding: const EdgeInsets.all(0),
              color: Colors.white,
              icon: const Icon(Icons.close),
              onPressed: () => context.go(AppRoute.home.path),
            ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(AppRoute.home.path),
          child: const Text('Go Home'),
        ),
      ),
    );
  }
}
