import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/app/toggle/app_toggles.dart';
import 'package:flutter_template/shared/app_version/app_version_provider.dart';
import 'package:version/version.dart';

enum AppUpdate {
  current,
  hardUpdate,
  softUpdate,
}

class AppUpdateNotifier extends AsyncNotifier<AppUpdate> {
  static final provider = AsyncNotifierProvider<AppUpdateNotifier, AppUpdate>(
    AppUpdateNotifier.new,
  );

  @override
  FutureOr<AppUpdate> build() async {
    final currentVersion = await ref.read(appVersionProvider.future);
    if (!_isSupported(currentVersion, AppToggles.appVersionMinHard)) {
      return AppUpdate.hardUpdate;
    }
    if (!_isSupported(currentVersion, AppToggles.appVersionMinSoft)) {
      return AppUpdate.softUpdate;
    }
    return AppUpdate.current;
  }

  bool isHardUpdate() {
    return state.maybeWhen(
      data: (data) => data == AppUpdate.hardUpdate,
      orElse: () => false,
    );
  }

  bool isSoftUpdate() {
    return state.maybeWhen(
      data: (data) => data == AppUpdate.softUpdate,
      orElse: () => false,
    );
  }

  bool _isSupported(String current, String targetVersion) {
    final currentVersion = Version.parse(current);
    return currentVersion >= Version.parse(targetVersion);
  }
}
