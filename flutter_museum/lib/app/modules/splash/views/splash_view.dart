import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_museum/app/utils/style/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_museum/app/modules/splash/controllers/splash_controller.dart';
import 'package:flutter_museum/app/utils/widget/widgets.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconApp(size: 512.h),
            TextFormat(
              "My Museum's",
              64.sp,
              fontWeight: FontWeight.w700,
              fontColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
