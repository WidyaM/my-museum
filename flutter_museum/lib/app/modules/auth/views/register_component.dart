part of 'auth_view.dart';

class RegisterComponent extends StatelessWidget {
  RegisterComponent({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: UniqueKey(),
      initialChildSize: 0.85,
      maxChildSize: 1.0,
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
                  controller.fullNameInput,
                  hint: "Full name",
                  inputType: TextInputType.name,
                ),
                SizedBox(height: 24.h),
                InputField(
                  controller.addressInput,
                  hint: "Address",
                  inputType: TextInputType.streetAddress,
                ),
                SizedBox(height: 24.h),
                InputField(
                  controller.emailInput,
                  hint: "Email",
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 24.h),
                InputField(
                  controller.passwordInput,
                  hint: "Password",
                  inputType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 24.h),
                InputField(
                  controller.confirmPasswordInput,
                  hint: "Confirmation Password",
                  inputType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 0.1.sh),
                ActionButton(
                  text: "Register",
                  boxColor: AppColors.primaryColor,
                  fontColor: AppColors.textColor,
                  minimumSize: Size(1.sw, 80.h),
                  onTap: () {
                    if (controller.checkSignUpInput()) {
                      openLoadingDialog();
                      controller.signUpUser();
                    }
                  },
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormat(
                      "already have an account? ",
                      28.sp,
                      fontWeight: FontWeight.w600,
                      fontColor: AppColors.darkColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.loginMode.value = true;
                      },
                      child: TextFormat(
                        "Login",
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
