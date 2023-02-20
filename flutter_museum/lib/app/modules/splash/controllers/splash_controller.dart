import 'package:flutter_museum/app/data/auth.dart';
import 'package:flutter_museum/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final authFirebase = Get.find<AuthFirebase>();
  SplashController() {
    init();
  }

  void init() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offAllNamed(Routes.auth);
      },
    );
  }
}
