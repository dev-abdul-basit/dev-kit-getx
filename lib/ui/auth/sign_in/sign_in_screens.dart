import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_template/Widgets/common_appbar.dart';
import 'package:get_template/Widgets/common_button.dart';
import 'package:get_template/Widgets/common_text.dart';
import 'package:get_template/Widgets/text_form_field.dart';
import 'package:get_template/generated/assets.dart';
import 'package:get_template/routes/app_routes.dart';
import 'package:get_template/ui/auth/sign_in/sign_in_controller.dart';
import 'package:get_template/ui/auth/social_login_screen/social_login_view.dart';
import 'package:get_template/utils/constant.dart';
import 'package:get_template/utils/sizer_utils.dart';

class SignInScreen extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Get.theme.colorScheme.onBackground,
          appBar: CommonAppBar(title: 'txtSignIn'.tr),
          body: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Get.theme.colorScheme.onBackground,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: AppSizes.height_1,
                            ),
                            GetBuilder<SignInController>(
                                id: Constant.idEmailInput,
                                builder: (logic) {
                                  return CommonTextFormFieldWithSuffix(
                                    shouldValidate: true,
                                    readOnly: false,
                                    controller: logic.emailController,
                                    hintText: 'txtEnterYourEmail'.tr,
                                    fillColor:
                                        Get.theme.colorScheme.surfaceVariant,
                                    validatorType: Constant.validationTypeEmail,
                                    validatorText: 'txtEnterValidEmail'.tr,
                                  );
                                }),
                            // const TextField(),
                            SizedBox(
                              height: AppSizes.height_2,
                            ),
                            GetBuilder<SignInController>(
                                id: Constant.idPasswordInput,
                                builder: (logic) {
                                  return CommonTextFormFieldWithSuffix(
                                    shouldValidate: true,
                                    readOnly: false,
                                    controller: logic.passwordController,
                                    hintText: 'txtEnterYourPassword'.tr,
                                    validatorText: 'txtEnterValidPassword'.tr,
                                    validatorType:
                                        Constant.validationTypePassword,
                                    fillColor:
                                        Get.theme.colorScheme.surfaceVariant,
                                    obscureText: logic.isShowPassword,

                                    suffixIcon: logic.isShowPassword

                                        ? Assets.iconsIcPasswordShow
                                        : Assets.iconsIcPasswordHide,
                                     onTapSuffix: logic.toggleShowHidePassword,
                                  );
                                }),
                            SizedBox(height: AppSizes.height_2),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () =>
                                    Get.toNamed(AppRoutes.forgotPassword),
                                child: CommonText(
                                    text: 'txtForgotPassword'.tr,
                                    textColor:
                                        Get.theme.colorScheme.onSecondary,
                                    fontWeight: FontWeight.w400,
                                    fontSize: AppFontSize.size_12),
                              ),
                            ),
                            SizedBox(
                              height: AppSizes.height_6_6,
                            ),

                            GetBuilder<SignInController>(builder: (logic) {
                              return CommonButton(
                                  onTap: () {
                                    //TODO:
                                    // logic.login(context);
                                  },
                                  text: 'txtSignIn'.tr);
                            }),
                            SizedBox(
                              height: AppSizes.height_3,
                            ),
                            orDivider(),
                            SizedBox(
                              height: AppSizes.height_2_5,
                            ),
                              const SocialLoginHorizontal(),
                            SizedBox(
                              height: AppSizes.height_3
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonText(
                                    text: 'txtDontHaveAnAccount'.tr,
                                    textColor: Get.theme.colorScheme.onSurface,
                                    fontWeight: FontWeight.w300,
                                    fontSize: AppFontSize.size_11),
                                SizedBox(width: AppSizes.height_0_5),
                                InkWell(
                                  onTap: () => Get.offNamed(AppRoutes.signUp),
                                  child: CommonText(
                                      text: 'txtSignUp'.tr,
                                      textColor:
                                          Get.theme.colorScheme.onPrimary,
                                      fontWeight: FontWeight.w700,
                                      fontSize: AppFontSize.size_12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
class SocialLoginHorizontal extends StatelessWidget {
  const SocialLoginHorizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (logic) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
           // onTap: () => logic.loginWithGoogle(context),
            child: Image.asset(Assets.imagesGoogle,
                height: AppSizes.height_7, width: AppSizes.height_7),
          ),
          InkWell(
            // onTap: () => logic.loginWithGoogle(context),
            child: Image.asset(Assets.imagesFacebook,
                height: AppSizes.height_7, width: AppSizes.height_7),
          ),
          if (Platform.isIOS)
            SizedBox(
              width: AppSizes.width_3,
            ),
          if (Platform.isIOS)
            InkWell(
             // onTap: () => logic.loginWithApple(context),
              child: Image.asset(Assets.imagesApple,
                  height: AppSizes.height_7, width: AppSizes.height_7),
            ),
        ],
      );
    });
  }
}
