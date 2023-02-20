part of 'auth_view.dart';

class LoginComponent extends StatelessWidget {
  LoginComponent({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: UniqueKey(),
      initialChildSize: 0.73,
      maxChildSize: 0.8,
      minChildSize: 0.6,
      builder: (context, controllerSwipe) {
        return Container(
          padding: EdgeInsets.only(
            top: 32.h,
            left: 32.w,
            right: 32.w,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.h),
              topRight: Radius.circular(24.h),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 32.h),
                InputField(
                  controller.emailInput,
                  hint: "Email",
                  inputType: TextInputType.emailAddress,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: AppColors.secondaryColor,
                  ),
                ),
                SizedBox(height: 24.h),
                InputField(
                  controller.passwordInput,
                  hint: "Password",
                  inputType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(
                    Icons.password,
                    color: AppColors.secondaryColor,
                  ),
                ),
                SizedBox(height: 0.1.sh),
                ActionButton(
                  text: "Login",
                  boxColor: AppColors.primaryColor,
                  fontColor: AppColors.textColor,
                  minimumSize: Size(1.sw, 80.h),
                  onTap: () {
                    if (controller.checkSignInInput()) {
                      openLoadingDialog();
                      controller.signInUser();
                    }
                  },
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormat(
                      "Don't have an account yet? ",
                      28.sp,
                      fontWeight: FontWeight.w600,
                      fontColor: AppColors.darkColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.loginMode.value = false;
                      },
                      child: TextFormat(
                        "Register",
                        28.sp,
                        fontWeight: FontWeight.w600,
                        fontColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
