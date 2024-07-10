import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_template/Widgets/common_button.dart';
import 'package:get_template/Widgets/common_text.dart';
import 'package:get_template/generated/assets.dart';
import 'package:get_template/routes/app_routes.dart';
import 'package:get_template/ui/auth/social_login_screen/social_login_logic.dart';

import 'package:get_template/utils/constant.dart';
import 'package:get_template/utils/preference.dart';
import 'package:get_template/utils/sizer_utils.dart';

class SocialLoginScreenView extends StatelessWidget {
  const SocialLoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.onBackground,
      body: GetBuilder<SocialLoginScreenLogic>(
        builder: (logic) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppPaddings.padding_20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: AppSizes.height_15),
                Image.asset(
                  Assets.imagesWelcomeImg,
                  height: AppSizes.height_15,
                ),
                SizedBox(height: AppSizes.height_4),
                Center(
                  child: CommonText(
                    text: 'txtLetYouIn'.tr,
                    textColor: Get.theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.size_40,
                    fontFamily: Constant.fontFamilyNunito,
                  ),
                ),
                SizedBox(height: AppSizes.height_6),
                const SocialLogin(),
                SizedBox(height: AppSizes.height_4),
                orDivider(),
                SizedBox(height: AppSizes.height_8),
                CommonButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.signIn);
                  },
                  text: 'txtSignInWithPassword'.tr,
                  backgroundColor: Get.theme.colorScheme.primary,
                  shadowColor: Get.theme.colorScheme.primary,
                ),
                SizedBox(height: AppSizes.height_1),
                signUpTextWIdget(),
                SizedBox(height: AppSizes.height_4),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialLoginScreenLogic>(builder: (logic) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Google Login
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Get.theme.colorScheme.onPrimaryContainer,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: InkWell(
              // onTap: () => logic.loginWithGoogle(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesGoogle,
                    height: AppSizes.height_5,
                  ),
                  SizedBox(width: AppSizes.width_0_2),
                  CommonText(
                    text: 'txtContinuewithGoogle'.tr,
                    textColor: Get.theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.normal,
                    fontSize: AppFontSize.size_14,
                    fontFamily: Constant.fontFamilyNunito,
                  ),
                ],
              ),
            ),
          ),
          // Facebook Login
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Get.theme.colorScheme.onPrimaryContainer,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: InkWell(
              // onTap: () => logic.loginWithFacebook(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesFacebook,
                    height: AppSizes.height_5,
                  ),
                  SizedBox(width: AppSizes.width_0_2),
                  CommonText(
                    text: 'txtContinuewithFacebook'.tr,
                    textColor: Get.theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.normal,
                    fontSize: AppFontSize.size_14,
                    fontFamily: Constant.fontFamilyNunito,
                  ),
                ],
              ),
            ),
          ),
          // Apple Login
          if (Platform.isIOS)
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Get.theme.colorScheme.onPrimaryContainer,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: InkWell(
                // onTap: () => logic.loginWithApple(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.imagesApple,
                      height: AppSizes.height_5,
                    ),
                    SizedBox(width: AppSizes.width_0_2),
                    CommonText(
                      text: 'txtContinuewithApple'.tr,
                      textColor: Get.theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.normal,
                      fontSize: AppFontSize.size_14,
                      fontFamily: Constant.fontFamilyNunito,
                    ),
                  ],
                ),
              ),
            ),
        ],
      );
    });
  }
}

Widget signUpTextWIdget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CommonText(
          text: 'txtDontHaveAnAccount'.tr,
          textColor: Get.theme.colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w300,
          fontSize: AppFontSize.size_11),
      SizedBox(width: AppSizes.height_0_5),
      InkWell(
        onTap: () => Get.toNamed(AppRoutes.signUp),
        child: CommonText(
            text: 'txtSignUp'.tr,
            textColor: Get.theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
            fontSize: AppFontSize.size_12),
      ),
    ],
  );
}

Widget orDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
    child: Row(
      children: [
        Flexible(
          child: Container(
            height: 1,
            color: Get.theme.colorScheme.onSurface,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CommonText(
                text: 'txtOrContinueWith'.tr,
                textColor: Get.theme.colorScheme.onSurface,
                fontWeight: FontWeight.w400,
                fontSize: AppFontSize.size_10)),
        Flexible(
          child: Container(
            height: 1,
            color: Get.theme.colorScheme.onSurface,
          ),
        ),
      ],
    ),
  );
}
