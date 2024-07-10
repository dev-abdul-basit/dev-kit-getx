import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:get_template/Widgets/common_button.dart';
import 'package:get_template/Widgets/common_text.dart';
import 'package:get_template/generated/assets.dart';
import 'package:get_template/routes/app_routes.dart';
import 'package:get_template/ui/home/home_controller.dart';

import 'package:get_template/utils/debug.dart';
import 'package:get_template/utils/font_style.dart';
import 'package:get_template/utils/sizer_utils.dart';

class AddSuccessDialog {
  final String? successTitle, successDescription, buttonText;
  final bool isMemberOrDoctor, isFromAppointment, isFromMedicine;
  final DateTime? tempStartDate;
  final TimeOfDay? tempSelectedTime;

  AddSuccessDialog(
      {this.isMemberOrDoctor = false,
      this.isFromAppointment = false,
      this.isFromMedicine = false,
      this.tempStartDate,
      this.tempSelectedTime,
      this.successDescription,
      required this.buttonText,
      this.successTitle});

  void scaleDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(a1),
          child: _dialog(ctx),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  Widget _dialog(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: AppSizes.fullWidth,
        color: Get.theme.colorScheme.onSurfaceVariant,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.height_2_7),
                child: Image.asset(
                  Assets.iconsIcPasswordHide,
                  color: Get.theme.colorScheme.onSurfaceVariant,
                  height: AppSizes.height_2,
                  width: AppSizes.height_2,
                ),
              ),
            ),
            Stack(
              children: [
                Lottie.asset(Assets.animationCelibretion1),
                Center(
                  heightFactor: 2.5,
                  child: Image.asset(
                    Assets.imagesImgUserOnboard1,
                    height: AppSizes.height_18,
                    width: AppSizes.height_18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.height_2,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppSizes.width_5),
              child: CommonText(
                  text: successTitle ?? 'txtSuccess'.tr,
                  textColor: Get.theme.colorScheme.inverseSurface,
                  textAlign: TextAlign.center,
                  fontSize: AppFontSize.size_19,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: AppSizes.height_0_5,
            ),
            if (isFromAppointment)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, AppSizes.height_0_5,
                    AppSizes.height_1, AppSizes.height_1),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: '${'txtYourAppointmentWith'.tr} ',
                          style: AppFontStyle.styleGrayLexendDeca13_400),
                    ],
                  ),
                ),
              ),
            if (!isFromAppointment)
              Container(
                width: AppSizes.fullWidth,
                margin: EdgeInsets.symmetric(horizontal: AppSizes.width_5),
                child: CommonText(
                    text: successDescription ?? '',
                    textColor: Get.theme.colorScheme.inverseSurface,
                    textAlign: TextAlign.center,
                    fontSize: AppFontSize.size_13,
                    fontWeight: FontWeight.w300),
              ),
            const Spacer(),
            CommonButton(
              onTap: () {

                  Get.back();
                  Get.offNamedUntil(
                      AppRoutes.home, ModalRoute.withName(AppRoutes.home));
                  Future.delayed(const Duration(milliseconds: 100), () {
                    Debug.printLog(
                        'Get.find<HomeController>().selectedTabIndex : ${Get.find<HomeController>().selectedTabIndex}');

                    // Get.forceAppUpdate();
                  });

              },
              backgroundColor: Get.theme.colorScheme.onSecondary,
              text: buttonText!,
            ),
            SizedBox(
              height: AppSizes.height_4,
            ),
          ],
        ),
      ),
    );
  }
}
