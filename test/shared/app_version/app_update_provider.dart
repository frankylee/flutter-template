import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/shared/app_version/app_update_provider.dart';
import 'package:mockito/mockito.dart';

class AppUpdateNotifierMock extends AsyncNotifier<AppUpdate>
    with Mock
    implements AppUpdateNotifier {
  AppUpdateNotifierMock({required this.returnValue});

  final AppUpdate returnValue;

  @override
  FutureOr<AppUpdate> build() => returnValue;
}
