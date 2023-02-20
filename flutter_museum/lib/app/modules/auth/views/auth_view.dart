import 'package:flutter_museum/app/utils/key.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_museum/app/utils/dialog.dart';
import 'package:flutter_museum/app/utils/widget/widgets.dart';
import 'package:flutter_museum/app/utils/style/app_colors.dart';
import 'package:flutter_museum/app/modules/auth/controllers/auth_controller.dart';

part 'login_component.dart';
part 'register_component.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('${Global.images}/museum.png'),
            Obx(() {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => SlideTransition(
                  position: Tween(
                    begin: const Offset(0.0, 1.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                ),
                child: controller.loginMode.value
                    ? LoginComponent()
                    : RegisterComponent(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
