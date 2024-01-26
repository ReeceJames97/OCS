import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/utils/app_colors.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

AlertDialog? mAlertDialog;
Dialog? mDialog;

void showConfirmDialog(Function confirmCallBack) {
  Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
            style: TextStyle(fontWeight: FontWeight.bold), AppStrings.confirm),
        content: const Text(AppStrings.areYouSureYouWantToDoThis),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.standardBtnColor),
                  AppStrings.no)),
          TextButton(
              onPressed: () {
                confirmCallBack();
              },
              child: const Text(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.standardBtnColor),
                  AppStrings.yes)),
        ],
      ));
}

Future<void> showLoadingDialog() async {

  mDialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    backgroundColor: AppColors.backgroundColor,
    child: Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      width: CustomScreenUtil().setWidth(150),
      height: CustomScreenUtil().setHeight(130),
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: AppColors.standardBtnColor,
          size: 50,
        ),
      ),
    ),
  );

  Get.dialog(
    mDialog!,
    barrierDismissible: false,
  );
  // Get.dialog(
  //   barrierDismissible: false,
  //   mDialog = Dialog(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(20.0),
  //     ),
  //     backgroundColor: AppColors.backgroundColor,
  //     child: Container(
  //         padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
  //         width: CustomScreenUtil().setWidth(150),
  //         height: CustomScreenUtil().setHeight(130),
  //         child: Center(
  //           child: LoadingAnimationWidget.staggeredDotsWave(
  //             color: AppColors.standardBtnColor,
  //             size: 50,
  //           ),
  //         ),
  //       ),
  //
  //   ),
  // );
}

void hideDialog() {
  if (mDialog != null) {
    mDialog = null;
    Get.back(closeOverlays: true);
  }

}

