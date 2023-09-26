import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/utils/app_colors.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:kf_ocs/utils/fontutils.dart';
import 'package:kf_ocs/utils/utils.dart';

void showSnackBar(String? message, {String? title}) {
  if (isNotNullEmptyString(message)) {
    Get.snackbar(
      title ?? "",
      message!,
      messageText: Text(
        message,
        style: TextStyle(
            fontSize: CustomScreenUtil().setSp(regularFont()),
            color: Colors.white,
            fontWeight: FontWeight.normal),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.snackBarBgColor,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      borderRadius: 5,
      snackStyle: SnackStyle.FLOATING,
      maxWidth: double.infinity,
    );
  }
}
