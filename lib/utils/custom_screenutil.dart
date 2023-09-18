import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomScreenUtil {
  bool isTablet = false;

  bool isLandSpace = false;
  double screenWidth = ScreenUtil().screenWidth;
  double screenHeight = ScreenUtil().screenHeight;

  CustomScreenUtil() {
    // double ratio = WidgetsBinding.instance.window.physicalSize.width / WidgetsBinding.instance.window.physicalSize.height;
    // double ratio = screenUtil.ScreenUtil().screenWidth / screenUtil.ScreenUtil().scaleHeight;
    // if( (ratio >= 0.74) || (ratio < 1.5) ) {
    //   isTablet = true;
    //   logD("Tablet");
    // } else{
    //   isTablet = false;
    //   logD("NOT Tablet");
    // }

    // final Size screenSize =
    //     MediaQueryData.fromView(WidgetsBinding.instance.window).size;
    final Size screenSize = MediaQuery.of(Get.context!).size;

    // Calculate the diagonal size of the screen
    final double diagonalSize = sqrt(
      (screenSize.width * screenSize.width) +
          (screenSize.height * screenSize.height),
    );

    // Determine if the diagonal size exceeds a certain threshold (e.g., 7 inches)
    //logD("Sized Tablet=  "+ diagonalSize.toString());
    if (diagonalSize >= 1100.0) {
      isTablet = true;
      // logD("Tablet");
    } else {
      /// Check Portaint or landSpace
      // final Orientation currentOrientation =
      //     WidgetsBinding.instance.window.physicalSize.width >
      //             WidgetsBinding.instance.window.physicalSize.height
      //         ? Orientation.landscape
      //         : Orientation.portrait;
      final Orientation currentOrientation = MediaQuery.of(Get.context!).orientation;
      if (currentOrientation == Orientation.landscape) {
        isLandSpace = true;
        // logD("LandSpace");
      } else {
        isLandSpace = false;
        // logD("NOT LandSpace");
      }

      // logD("NOT Tablet");
    }
  }

  double setWidth(num width) {
    if (isTablet) {
      return width * 1.0;
    } else {
      if (isLandSpace) {
        return ScreenUtil().setWidth(width / 2);
      } else {
        return ScreenUtil().setWidth(width);
      }
    }
  }

  double setSp(num sp) {
    if (isTablet) {
      return sp * 1.0;
    } else {
      if (isLandSpace) {
        return ScreenUtil().setSp(sp);
      } else {
        return ScreenUtil().setSp(sp);
      }
    }
  }

  double setHeight(num height) {
    if (isTablet) {
      return height * 1.0;
    } else {
      if (isLandSpace) {
        return ScreenUtil().setHeight(height * 1.2);
      } else {
        return ScreenUtil().setHeight(height);
      }
    }
  }
}
