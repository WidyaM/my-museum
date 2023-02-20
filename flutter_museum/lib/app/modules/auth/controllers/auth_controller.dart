import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_museum/app/data/auth.dart';
import 'package:flutter_museum/app/utils/dialog.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final fullNameInput = TextEditingController();
  final addressInput = TextEditingController();
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();
  final confirmPasswordInput = TextEditingController();
  final authFirebase = Get.find<AuthFirebase>();

  // Reactive variable
  RxBool loginMode = true.obs;

  void signInUser() {
    authFirebase.signIn(
      email: emailInput.text,
      password: passwordInput.text,
    ).then((value) {
      Get.back();
      if (value != null) {
        openErrorDialog(value);
      } else {
        openSuccessDialog("Login Success");
      }
    });
  }

  bool checkSignInInput() {
    if (emailInput.text.isEmpty) {
      openErrorDialog("Email cannot empty");
      return false;
    }
    if (passwordInput.text.isEmpty) {
      openErrorDialog("Password cannot empty");
      return false;
    }
    return true;
  }

  void signUpUser() {
    authFirebase
        .signUp(
      email: emailInput.text,
      password: passwordInput.text,
      fullName: fullNameInput.text,
      address: addressInput.text,
    ).then((value) {
      Get.back();
      if (value != null) {
        openErrorDialog(value);
      } else {
        openSuccessDialog("Register Success");
      }
    });
  }

  bool checkSignUpInput() {
    if (emailInput.text.isEmpty) {
      openErrorDialog("Email cannot empty");
      return false;
    }
    if (addressInput.text.isEmpty) {
      openErrorDialog("Address cannot empty");
      return false;
    }
    if (fullNameInput.text.isEmpty) {
      openErrorDialog("Full Name cannot empty");
      return false;
    }
    if (passwordInput.text.isEmpty) {
      openErrorDialog("Password cannot empty");
      return false;
    }
    if (confirmPasswordInput.text.isEmpty) {
      openErrorDialog("Confirmation password cannot empty");
      return false;
    }

    if (confirmPasswordInput.text != passwordInput.text) {
      openErrorDialog("Confirmation password cannot different");
      return false;
    }
    return true;
  }
}
