import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_template/Widgets/common_button.dart';
import 'package:get_template/Widgets/common_text.dart';
import 'package:get_template/utils/sizer_utils.dart';

class NoHistoryWidget extends StatelessWidget {
  final String image, text, description, buttonText;
  final void Function() onTapCreate;
  const NoHistoryWidget({
    super.key,
    required this.image,
    required this.text,
    required this.description,
    required this.buttonText,
    required this.onTapCreate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 24, vertical: Platform.isIOS ? 0 : 24),
      width: AppSizes.fullWidth,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: AppSizes.height_13),
            Image.asset(
              image,
              height: AppSizes.height_10,
              width: AppSizes.height_10,
            ),
            SizedBox(height: AppSizes.height_1),
            CommonText(
                text: text,
                textColor: Get.theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: AppFontSize.size_14),
            SizedBox(height: AppSizes.height_1),
            CommonText(
                text: description,
                textColor: Get.theme.colorScheme.surface,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                fontSize: AppFontSize.size_10),
            //const Spacer(),
            SizedBox(height: AppSizes.height_5),
            CommonButton(
              onTap: onTapCreate,
              backgroundColor: Get.theme.colorScheme.primary,
              text: buttonText,
            ),
            SizedBox(height: AppSizes.height_2),
          ],
        ),
      ),
    );
  }
}
