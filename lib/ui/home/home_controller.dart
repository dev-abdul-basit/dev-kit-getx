import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_template/connectivity_manager/connectivity_manager.dart';
import 'package:get_template/main.dart';
import 'package:get_template/routes/app_routes.dart';
import 'package:get_template/ui/auth/sign_in/sign_in_controller.dart';
import 'package:get_template/utils/constant.dart';
import 'package:get_template/utils/debug.dart';
import 'package:get_template/utils/enums.dart';
import 'package:get_template/utils/preference.dart';
import 'package:get_template/utils/utils.dart';


class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  String theme = AppThemeMode.light.toString();
  
  
  bool canPop = false;
  bool isDrawerOpen = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  int selectedTabIndex = 0;
  bool isFromLogin = false;
  var data = Get.parameters;

  TabController? mainTabController;

  @override
  Future<void> onInit() async {
    update([Constant.idHome]);
    mainTabController =
        mainTabController ?? TabController(length: 2, vsync: this);
    Debug.printLog("isFromLogin: ${data[Constant.idIsFromLogIn]}");
    isFromLogin = data[Constant.idIsFromLogIn] == 'true';
    
    getCurrentTheme();
    
 
   
    if (await InternetConnectivity.isInternetConnect(Get.context!)) {
      //show error message
    }

   

    super.onInit();
  }

  
  

 
 
  void onWillPop(didPop) {
    if (isDrawerOpen) {
      Debug.printLog("isDrawerOpen : $isDrawerOpen ");
      // canPop = true;
      // update([Constant.idHome]);
      // Navigator.of(Get.context!).pop();
    } else if (!isDrawerOpen) {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
        currentBackPressTime = now;
        Fluttertoast.showToast(msg: 'txtPressBackAgainToExitTheApp'.tr);
        canPop = true;
        // }
      } else {
        canPop = false;
      }
    }
    update([Constant.idHome]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  onThemeChanged(value) {
    theme = value.toString();
    if (theme == AppThemeMode.light.toString()) {
      Get.changeThemeMode(ThemeMode.light);
      Preference.shared.setAppTheme(Constant.appThemeLight);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      Preference.shared.setAppTheme(Constant.appThemeDark);
    }

    Future.delayed(const Duration(milliseconds: 200), () {
      Get.back();
      update(
          [Constant.idSettingsTheme, Constant.idHome, Constant.idDrawerSheet]);
    });
  }

  getCurrentTheme() {
    theme = Utils.isLightTheme()
        ? AppThemeMode.light.toString()
        : AppThemeMode.dark.toString();
    update([Constant.idSettingsTheme, Constant.idHome, Constant.idDrawerSheet]);
  }

  singOut(context) async {
    if (await InternetConnectivity.isInternetConnect(context)) {
      try {
        
        await _auth.signOut();

        Preference.shared.setIsUserLogin(false);
        Preference.shared.setProfileAdded(false);
        
        Get.deleteAll(force: true);

        Get.offAllNamed(AppRoutes.signIn);
        Utils.showToast(context, "toastLogOut".tr);
      } catch (e) {
        Utils.showToast(context, e.toString());
      }
    } else {
      Utils.showToast(context, "txtCheckYourInternetConnectivity".tr);
    }
  }

 
  getThemeString() {
    if (theme == AppThemeMode.dark.toString()) {
      return "txtDark".tr;
    } else {
      return "txtLight".tr;
    }
  }

  goToProfile(BuildContext context) {
    if (!Preference.shared.getIsPurchase()) {
     
    }
    Scaffold.of(context).closeDrawer();
    Get.toNamed(AppRoutes.addOrEditProfile,
        parameters: {Constant.idIsEditProfile: "true"});
  }

  void onTabSelected(int tabIndex) {
    selectedTabIndex = tabIndex;
    mainTabController!.index = selectedTabIndex;
    update([Constant.idHome]);
  }

  void onDrawerChanged(bool isOpened) {
    isDrawerOpen = isOpened;
    canPop = false;
    update([Constant.idHome]);
  }

  void goToSetting(BuildContext context) {
    if (!Preference.shared.getIsPurchase()) {
     
    }
    Get.toNamed(AppRoutes.setting);
  }

 

  
  

  
}
