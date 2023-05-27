import 'package:flutter/foundation.dart';

/// App Theme ViewModel
/// [light] true = Light Theme, false = Dark Theme
class ThemeVM with ChangeNotifier {
  bool _light = true;

  bool get light => _light;

  /// App Theme Change, Light <-> Dark
  change() {
    _light = !_light;
    notifyListeners();
  }
}
