

import 'package:blog/core/providers/current_platform_providers.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
}

extension FontSizeExtension on double {
  double test() => 2;
}

extension CurrentPlatformExtension on CurrentPlatform {
  double platformDouble(double mobileSize, double tabletSize, double desktopSize) {
    switch (this) {
      case CurrentPlatform.mobile:
        return mobileSize;
      case CurrentPlatform.tablet:
        return tabletSize;
      case CurrentPlatform.desktop:
        return desktopSize;
    }
  }

  int platformInt(int mobileSize, int tabletSize, int desktopSize) {
    switch (this) {
      case CurrentPlatform.mobile:
        return mobileSize;
      case CurrentPlatform.tablet:
        return tabletSize;
      case CurrentPlatform.desktop:
        return desktopSize;
    }
  }
}