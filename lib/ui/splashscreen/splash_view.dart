import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_template/Widgets/common_text.dart';
import 'package:get_template/generated/assets.dart';
import 'package:get_template/utils/color.dart';
import 'package:get_template/utils/constant.dart';

import 'package:get_template/utils/sizer_utils.dart';

import 'splash_logic.dart';

class SplashViewPage extends StatelessWidget {
  const SplashViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Get.theme.colorScheme.onBackground,
        extendBodyBehindAppBar: true,
        body: GetBuilder<SplashScreenLogic>(builder: (logic) {
          return Stack(
            children: [
              Image.asset(
                Assets.assetsSplashscreen,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: CommonText(
                    text: Constant.appTitle,
                    textColor: AppColor.white,
                    textAlign: TextAlign.center,
                    fontSize: AppFontSize.size_23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
