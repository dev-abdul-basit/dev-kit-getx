import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_template/Widgets/common_appbar.dart';
import 'package:get_template/Widgets/common_button.dart';
import 'package:get_template/Widgets/common_text.dart';
import 'package:get_template/Widgets/text_form_field.dart';
import 'package:get_template/Widgets/progress_dialog.dart';
import 'package:get_template/routes/app_routes.dart';
import 'package:get_template/utils/constant.dart';
import 'package:get_template/utils/sizer_utils.dart';
import 'package:get_template/utils/utils.dart';

import '../../../generated/assets.dart';
import 'sign_up_logic.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SignUpLogic>();

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Get.theme.colorScheme.onBackground,
          appBar: CommonAppBar(title: 'txtSignUp'.tr),
          body: Form(
            key: logic.formKey,
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
                              height: AppSizes.height_1_8,
                            ),
                            GetBuilder<SignUpLogic>(
                                id: Constant.idEmailInput,
                                builder: (logic) {
                                  return CommonTextFormFieldWithSuffix(
                                    shouldValidate: true,
                                    readOnly: false,
                                    controller: logic.emailController,
                                    hintText: 'txtEmail'.tr,
                                    fillColor:
                                    Get.theme.colorScheme.surfaceVariant,

                                    validatorType: Constant.validationTypeEmail,
                                    validatorText: 'txtEnterValidEmail'.tr,
                                  );
                                }),
                            SizedBox(
                              height: AppSizes.height_2,
                            ),
                            GetBuilder<SignUpLogic>(
                                id: Constant.idPasswordInput,
                                builder: (logic) {
                                  return CommonTextFormFieldWithSuffix(
                                    shouldValidate: true,
                                    readOnly: false,
                                    controller: logic.passwordController,
                                    hintText: 'txtPassword'.tr,
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
                            SizedBox(
                              height: AppSizes.height_2,
                            ),
                            GetBuilder<SignUpLogic>(
                                id: Constant.idConfirmPasswordInput,
                                builder: (logic) {
                                  return CommonTextFormFieldWithSuffix(
                                    shouldValidate: true,
                                    readOnly: false,
                                    controller: logic.confirmPasswordController,
                                    hintText: 'txtConformPassword'.tr,
                                    validatorText: 'txtEnterValidPassword'.tr,
                                    validatorType:
                                    Constant.validationTypePassword,
                                    fillColor:
                                    Get.theme.colorScheme.surfaceVariant,
                                    obscureText: logic.isShowConformPassword,

                                    suffixIcon: logic.isShowConformPassword
                                        ? Assets.iconsIcPasswordShow
                                        : Assets.iconsIcPasswordHide,
                                    onTapSuffix:
                                    logic.toggleShowHideConformPassword,
                                  );
                                }),
                            SizedBox(
                              height: AppSizes.height_3,
                            ),

                            GetBuilder<SignUpLogic>(builder: (logic) {
                              return CommonButton(
                                  onTap: () {
                                   // logic.singUp(context);
                                    Get.toNamed(AppRoutes.addOrEditProfile,parameters: {Constant.idEmailInput: "true"});
                                  },
                                  text: 'txtSignUp'.tr);
                            }),
                            // const LoginButton(),

                            SizedBox(
                              height: AppSizes.height_2_5,
                            ),
                            orDivider(),
                            SizedBox(
                              height: AppSizes.height_2_5,
                            ),
                          //  const SocialLogin(),
                            SizedBox(
                              height: AppSizes.height_3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonText(
                                    text: 'txtAlreadyHaveAnAccount'.tr,
                                    textColor: Get.theme.colorScheme.onSurface,
                                    fontWeight: FontWeight.w300,
                                    fontSize: AppFontSize.size_10),
                                SizedBox(width: AppSizes.height_0_5),
                                InkWell(
                                  onTap: () => Get.offNamed(AppRoutes.signIn),
                                  child: CommonText(
                                      text: 'txtSignIn'.tr,
                                      textColor:
                                      Get.theme.colorScheme.onSecondary,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommonText(
                        text: 'txtByContinueYouAgree'.tr,
                        textColor: Get.theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w300,
                        fontSize: AppFontSize.size_9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () =>
                              Utils.urlLauncher(Constant.privacyPolicyURL),
                          child: CommonText(
                              text: 'txtTerms'.tr,
                              textColor: Get.theme.colorScheme.onSecondary,
                              fontWeight: FontWeight.w700,
                              textDecoration: TextDecoration.underline,
                              decorationColor:
                                  Get.theme.colorScheme.onSecondary,
                              fontSize: AppFontSize.size_10),
                        ),
                        CommonText(
                            text: ' & ',
                            textColor: Get.theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w300,
                            fontSize: AppFontSize.size_11),
                        InkWell(
                          onTap: () =>
                              Utils.urlLauncher(Constant.privacyPolicyURL),
                          child: CommonText(
                              text: 'txtPrivacy'.tr,
                              textColor: Get.theme.colorScheme.onSecondary,
                              fontWeight: FontWeight.w700,
                              textDecoration: TextDecoration.underline,
                              decorationColor:
                                  Get.theme.colorScheme.onSecondary,
                              fontSize: AppFontSize.size_10),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSizes.height_3_5,
                ),
              ],
            ),
          ),
        ),
        GetBuilder<SignUpLogic>(
          id: Constant.idProVersionProgress,
          builder: (logic) {
            return ProgressDialog(
              inAsyncCall: logic.isShowProgress,
              child: const SizedBox(),
            );
          },
        ),
      ],
    );
  }
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