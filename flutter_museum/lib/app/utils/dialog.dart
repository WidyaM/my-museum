import 'package:flutter/material.dart';
import 'package:flutter_museum/app/utils/style/app_colors.dart';
import 'package:flutter_museum/app/utils/widget/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void openLoadingDialog() {
  Get.dialog(
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 0.1.sw,
        vertical: 0.4.sh,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 24.h,
        horizontal: 32.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          TextFormat("Loading..", 32.sp),
        ],
      ),
    ),
    barrierDismissible: false,
    useSafeArea: true,
  );
}

void openErrorDialog(String message) {
  Get.dialog(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 24.h,
            horizontal: 24.w,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 32.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.close,
                color: AppColors.alertColor,
                size: 146.h,
              ),
              TextFormat(
                message,
                32.sp,
                maxLines: 5,
              ),
            ],
          ),
        )
      ],
    ),
    useSafeArea: true,
  );
}

void openSuccessDialog(String message) {
  Get.dialog(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 24.h,
            horizontal: 24.w,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 32.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.done,
                color: AppColors.greenColor,
                size: 146.h,
              ),
              TextFormat(
                message,
                32.sp,
                maxLines: 5,
              ),
            ],
          ),
        )
      ],
    ),
    useSafeArea: true,
  );
}
