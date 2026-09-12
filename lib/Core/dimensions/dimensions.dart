import 'package:flutter_screenutil/flutter_screenutil.dart';

/// [Dimensions]
/// Contains the dimension values used in the app.
/// this value for responsive design and auto size for different screen sizes
class Dimensions {
  static int get gridCount {
    if (1.sw < 450) {
      return 3;
    } else if (1.sw < 550) {
      return 4;
    } else if (1.sw < 700) {
      return 5;
    } else if (1.sw < 800) {
      return 6;
    } else if (1.sw < 900) {
      return 7;
    } else {
      return 8;
    }
  }

  static double autoSize(double baseSize) {
    const double refWidth = 430.0;
    const double refHeight = 930.0;

    final double widthScale = 1.sw / refWidth;
    final double heightScale = 1.sh / refHeight;

    final double totalScale = (widthScale + heightScale) / 2;

    final double smoothFactor = 1.0 + (totalScale - 1.0) * 0.4;

    return baseSize * smoothFactor;
  }
}
