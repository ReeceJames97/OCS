import 'package:flutter/material.dart';
import 'package:kf_ocs/utils/app_colors.dart';

AppBar getAppbar(String title,
    {List<Widget>? actionWidget, Color? appBarColor}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    titleTextStyle: const TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    backgroundColor: appBarColor ?? AppColors.appBarColor,
    iconTheme: const IconThemeData(color: Colors.white),
    actions: actionWidget,
  );
}
