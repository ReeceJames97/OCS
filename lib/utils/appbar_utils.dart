import 'package:flutter/material.dart';
import 'package:kf_ocs/utils/colors.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:kf_ocs/utils/fontutils.dart';

AppBar getAppbar(String title, {List<Widget>? actionWidget,Color? appBarColor}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold
    ),
    backgroundColor: appBarColor ?? COLORS.app_bar_color,
    iconTheme: const IconThemeData(color: Colors.white),
    actions: actionWidget,
  );
}
