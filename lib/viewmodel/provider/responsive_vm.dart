import 'package:flutter/foundation.dart';

/// Responsive app, mobile, desktop mode 인지 확인하기 위한 View Model
/// [_extend] true = Desktop, false = Mobile
class ResponsiveVM extends ChangeNotifier {
  bool _extend = false;

  bool get extend => _extend;

  // current maxWidth 를 통해서 desktop, mobile 분기
  extendChange(double maxWidth) {
    bool isExtend = maxWidth > 600;

    if (isExtend == _extend) {
      return;
    }

    print(isExtend ? 'Desktop Mode' : 'Mobile Mode');
    _extend = isExtend;
  }
}
