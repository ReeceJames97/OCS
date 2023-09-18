import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Size getCurrentSize(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Size(width, height);
}

Size getNormalSize(BuildContext context) {
  return const Size(750, 1334);
}

void setScreenDefault(BuildContext context) {
  ScreenUtil.init(
    context,
    designSize: getNormalSize(context),
    minTextAdapt: true,
    splitScreenMode: true,
  );
}

double setScanHeight() {
  return ScreenUtil().setHeight(330);
}
