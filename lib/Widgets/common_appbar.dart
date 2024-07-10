import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_template/Widgets/common_text.dart';
import 'package:get_template/generated/assets.dart';
import 'package:get_template/utils/constant.dart';
import 'package:get_template/utils/preference.dart';
import 'package:get_template/utils/sizer_utils.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;
  final VoidCallback? onActionTap;
  final Widget? actionWidget;

  const CommonAppBar({
    super.key,
    required this.title,
    this.onBackTap,
    this.onActionTap,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    String lagType = Preference.shared.getString(Preference.selectedLanguage) ??
        Constant.languageEn;
    return Container(
      padding: Platform.isIOS
          ? EdgeInsets.zero
          : EdgeInsets.only(top: AppSizes.height_3_5),
      decoration: BoxDecoration(
        color: Get.context!.theme.colorScheme.inversePrimary,
        borderRadius: const BorderRadiusDirectional.only(
          bottomStart: Radius.circular(30),
          bottomEnd: Radius.circular(30),
        ),
      ),
      child: AppBar(
        backgroundColor: Get.context!.theme.colorScheme.inversePrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(30),
            bottomEnd: Radius.circular(30),
          ),
        ),
        //  elevation: 10,
        surfaceTintColor: Get.context!.theme.colorScheme.inversePrimary,
        shadowColor: Get.theme.colorScheme.primary.withOpacity(0.3),
        centerTitle: false,
        title: CommonText(
            text: title,
            textColor: Get.theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
            fontSize: AppFontSize.size_18),
        titleSpacing: AppSizes.width_1,
        leading: RotatedBox(
          quarterTurns:
              lagType == 'ar' || lagType == 'ur' || lagType == 'fa' ? 90 : 0,
          child: Container(
            margin: EdgeInsetsDirectional.only(start: AppSizes.width_3),
            child: IconButton(
              icon: SvgPicture.asset(Assets.iconsArrowback,
                  color: Get.theme.colorScheme.onPrimary,
                  height: AppSizes.height_2_5,
                  width: AppSizes.height_2_5,
                  fit: BoxFit.contain),
              onPressed: onBackTap ??
                  () {
                    Get.forceAppUpdate();
                    Get.back();
                  },
            ),
          ),
        ),
        actions: [
          if (actionWidget != null)
            // Container(
            //     alignment: Alignment.center,
            //     height: AppSizes.height_5,
            //     width: AppSizes.height_5,
            //     child: actionWidget!),
            Container(
              margin: EdgeInsetsDirectional.only(end: AppSizes.width_5_5),
              child: IconButton(
                icon: actionWidget!,
                onPressed: onActionTap,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      Platform.isIOS ? AppFontSize.size_50 : AppFontSize.size_75);
}
