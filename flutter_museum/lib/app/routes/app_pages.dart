import 'package:flutter_museum/app/modules/auth/views/auth_view.dart';
import 'package:flutter_museum/app/modules/auth/bindings/auth_bindings.dart';
import 'package:flutter_museum/app/modules/splash/views/splash_view.dart';
import 'package:flutter_museum/app/modules/splash/bindings/splash_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: _Paths.auth,
      page: () => const AuthView(),
      binding: AuthBinding(),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
