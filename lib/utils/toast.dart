import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kf_ocs/utils/colors.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:kf_ocs/utils/fontutils.dart';
import 'package:kf_ocs/utils/utils.dart';

void showToast(String? message) {
  if (isNotNullEmptyString(message)) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message!,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: CustomScreenUtil().setSp(regularFont()),
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.toastBackgroundColor,
        textColor: Colors.white);
  }
}
