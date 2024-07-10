import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_template/Widgets/common_appbar.dart';
import 'package:get_template/ui/setting/setting_screen_logic.dart';
import 'package:get_template/utils/constant.dart';

class SettingScreenPage extends StatelessWidget {
  const SettingScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingScreenLogic>(
        id: Constant.idSetting,
        builder: (logic) {
          return Scaffold(
            backgroundColor: Get.theme.colorScheme.onBackground,
            appBar: CommonAppBar(title: 'txtSettings'.tr),
          );
        });
  }

}
