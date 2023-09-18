import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as screenUtil;

class CustomScreenUtil {
  bool isTablet = false;

  bool isLandSpace = false;
  double screenWidth = screenUtil.ScreenUtil().screenWidth;
  double screenHeight = screenUtil.ScreenUtil().screenHeight;

  CustomScreenUtil() {
    final Size screenSize =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

    // Calculate the diagonal size of the screen
    final double diagonalSize = sqrt(
      (screenSize.width * screenSize.width) +
          (screenSize.height * screenSize.height),
    );

    // Determine if the diagonal size exceeds a certain threshold (e.g., 7 inches)
    if (diagonalSize >= 1100.0) {
      isTablet = true;
    } else {
      /// Check Portrait or landSpace
      final Orientation currentOrientation =
          WidgetsBinding.instance.window.physicalSize.width >
                  WidgetsBinding.instance.window.physicalSize.height
              ? Orientation.landscape
              : Orientation.portrait;
      if (currentOrientation == Orientation.landscape) {
        isLandSpace = true;
      } else {
        isLandSpace = false;
      }
    }
  }

  double setWidth(num width) {
    if (isTablet) {
      return width * 1.0;
    } else {
      if (isLandSpace) {
        return screenUtil.ScreenUtil().setWidth(width / 2);
      } else {
        return screenUtil.ScreenUtil().setWidth(width);
      }
    }
  }

  double setSp(num sp) {
    if (isTablet) {
      return sp * 1.0;
    } else {
      if (isLandSpace) {
        return screenUtil.ScreenUtil().setSp(sp);
      } else {
        return screenUtil.ScreenUtil().setSp(sp);
      }
    }
  }

  double setHeight(num height) {
    if (isTablet) {
      return height * 1.0;
    } else {
      if (isLandSpace) {
        return screenUtil.ScreenUtil().setHeight(height * 1.2);
      } else {
        return screenUtil.ScreenUtil().setHeight(height);
      }
    }
  }
}
