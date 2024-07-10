import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/assets.dart';
import '../utils/sizer_utils.dart';
import 'common_button_with_image.dart';
import 'common_text.dart';

class PickFormDialog extends StatelessWidget {
  final String? title;

  final void Function() onTapGallery, onTapCamera;

  const PickFormDialog(
      {super.key,
        required this.title,
        required this.onTapGallery,
        required this.onTapCamera});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: AppSizes.fullWidth,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.surfaceVariant,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(50),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: AppSizes.height_2,
              ),
              CommonText(
                  text: title ?? 'Test',
                  textColor: Get.theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSize.size_17),
              SizedBox(
                height: AppSizes.height_2,
              ),
              CommonButtonWithImage(
                iconColor: Get.theme.colorScheme.onSurfaceVariant,
                  icon: Assets.iconsIcGallery,
                  onTap: onTapGallery,
                  text: 'txtFromGallery'.tr),
              SizedBox(
                height: AppSizes.height_2,
              ),
              CommonButtonWithImage(
                iconColor: Get.theme.colorScheme.primary,
                  icon: Assets.iconsIcCamera,
                  onTap: onTapCamera,
                  backgroundColor: Get.theme.colorScheme.background,
                  text: 'txtFromCamera'.tr),
              SizedBox(
                height: AppSizes.height_5,
              ),
            ],
          ),
        )
      ],
    );
  }
}
