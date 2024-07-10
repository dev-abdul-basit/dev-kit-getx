import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_template/Widgets/common_text.dart';
import 'package:get_template/utils/sizer_utils.dart';

class CommonButton extends StatelessWidget {
  final void Function() onTap;

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? shadowColor;
  const CommonButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.backgroundColor,
      this.foregroundColor,
      this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.fullWidth - 50,
      height: AppSizes.height_5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: (shadowColor ?? Get.theme.colorScheme.primary)
                  .withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onTap,
          // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
          style: ElevatedButton.styleFrom(
            //shadowColor: Get.theme.colorScheme.primary,
            elevation: 0,
            backgroundColor: backgroundColor ?? Get.theme.colorScheme.primary,
            foregroundColor:
                foregroundColor ?? Get.theme.colorScheme.background,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            splashFactory: InkSplash.splashFactory,
          ),
          child: CommonText(
            text: text,
            textColor: Get.theme.colorScheme.onSurfaceVariant,
            textAlign: TextAlign.center,
            fontSize: AppFontSize.size_12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
