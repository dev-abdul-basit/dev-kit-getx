import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_template/Widgets/common_button.dart';
import 'package:get_template/Widgets/common_text.dart';
import 'package:get_template/generated/assets.dart';
import 'package:get_template/routes/app_routes.dart';

import 'package:get_template/utils/constant.dart';
import 'package:get_template/utils/preference.dart';
import 'package:get_template/utils/sizer_utils.dart';

import 'welcome_logic.dart';

class WelcomeScreenPage extends StatelessWidget {
  const WelcomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.colorScheme.onBackground,
        body: GetBuilder<WelcomeScreenLogic>(
            id: Constant.idPageView,
            builder: (logic) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: AppSizes.height_15),
                    Image.asset(Assets.imagesWelcomeImg),
                    SizedBox(height: AppSizes.height_10),
                    CommonText(
                        text: 'txtWelcomeTo'.tr,
                        textColor: Get.theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontSize.size_18,),
                    CommonText(
                        text: 'txtTaskBuddy'.tr,
                        textColor: Get.theme.colorScheme.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontSize.size_36),
                    SizedBox(height: AppSizes.height_12),
                    CommonText(
                        text: 'txtChooseYourAccountType'.tr,
                        textColor: Get.theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontSize.size_16),
                    SizedBox(height: AppSizes.height_2),
                    Row(
                      children: [
                        Expanded(
                          child: CommonButton(
                            onTap: () {
                              Preference.shared
                                  .setUserType(Constant.appRoleUser);
                              Get.offAllNamed(AppRoutes.getStarted);
                              print(Preference.shared.getUserRole());
                            },
                            text: 'txtUser'.tr,
                            backgroundColor: Get.theme.colorScheme.secondary,
                            shadowColor: Get.theme.colorScheme.secondary,
                          ),
                        ),
                        SizedBox(width: AppSizes.width_2),
                        Expanded(
                          child: CommonButton(
                            onTap: () {
                              Preference.shared
                                  .setUserType(Constant.appRoleTasker);
                              Get.offAllNamed(AppRoutes.getStarted);
                              print(Preference.shared.getUserRole());
                            },
                            text: 'txtTasker'.tr,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.height_4),
                  ],
                ),
              );
            }));
  }
}
