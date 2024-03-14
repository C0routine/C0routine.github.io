import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_platform_providers.g.dart';

enum CurrentPlatform {
  mobile,
  tablet,
  desktop,
}

@Riverpod(keepAlive: true)
class CurrentPlatforms extends _$CurrentPlatforms {
  @override
  CurrentPlatform build() {
    return CurrentPlatform.desktop;
  }

  void _changeState(CurrentPlatform platform) {
    if (state != platform) {
      state = platform;
    }
  }

  void changePlatform(BoxConstraints constraints) {
    if (constraints.maxWidth < 450) {
      _changeState(CurrentPlatform.mobile);
    } else if (constraints.maxWidth < 800) {
      _changeState(CurrentPlatform.tablet);
    } else {
      _changeState(CurrentPlatform.desktop);
    }
  }
}
