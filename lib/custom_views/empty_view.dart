
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:lottie/lottie.dart';

Widget getEmptyView({String? message, String? title, bool isAnimate = false}) {
  return SingleChildScrollView(
    child: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: CustomScreenUtil().setWidth(40),
          ),

          (isAnimate)?Container(
            child: Lottie.asset('assets/images/empty-box.json',
                width: 120,
                height: 120,
                animate: true,
                repeat: true,
                fit: BoxFit.fill),
          ):SvgPicture.asset(
            "assets/images/ic_empty.svg",
            matchTextDirection: true,
            width: CustomScreenUtil().setWidth(210),
            height: CustomScreenUtil().setWidth(210),
          ),


          SizedBox(
            height: CustomScreenUtil().setWidth(40),
          ),
          Text(
            (title != null && title.isNotEmpty) ? title : AppStrings.empty_data,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: CustomScreenUtil().setSp(40),
                fontWeight: FontWeight.bold,
                color: Colors.grey
            ),
          ),
          SizedBox(
            height: CustomScreenUtil().setWidth(40),
          ),
          Text(
            (message == null || message == "") ? AppStrings.nothing_to_show : message,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: CustomScreenUtil().setSp(28),
                color: Colors.grey
            ),
          )
        ],
      ),
    ),
  );
}
