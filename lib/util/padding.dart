import 'package:sizer/sizer.dart';

class CustomPadding {
  static double wide() {
    if (Device.screenType == ScreenType.mobile) {
      return 5.w;
    }
    return 15.w;
  }
}
