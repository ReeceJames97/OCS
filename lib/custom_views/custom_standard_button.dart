import 'package:flutter/material.dart';
import 'package:kf_ocs/utils/colors.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:kf_ocs/utils/fontutils.dart';

MaterialButton customStandardBtn(String text,
    {Function? callBack, bool isEnable = true, Color? buttonColor}) {
  return MaterialButton(
      elevation: 6,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
              color: isEnable
                  ? buttonColor ?? COLORS.standard_button_color
                  : Colors.grey)),
      minWidth: double.infinity,
      height: CustomScreenUtil().setWidth(85),
      color: buttonColor ?? COLORS.standard_button_color,
      disabledColor: COLORS.button_disable_color,
      onPressed: isEnable
          ? () {
              if (callBack != null) {
                callBack();
              }
            }
          : null,
      child: Text(text,
          style: TextStyle(
            fontSize: CustomScreenUtil().setSp(regularFont()),
              color: isEnable ? Colors.white : Colors.black,
          )));
}
