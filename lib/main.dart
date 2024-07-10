import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';

import 'package:get_template/connectivity_manager/connectivity_manager.dart';

import 'package:get_template/firebase_options.dart';

import 'package:get_template/localization/locale_constant.dart';
import 'package:get_template/localization/localizations_delegate.dart';
import 'package:get_template/routes/app_pages.dart';
import 'package:get_template/routes/app_routes.dart';
import 'package:get_template/themes/app_theme.dart';
import 'package:get_template/utils/color.dart';
import 'package:get_template/utils/constant.dart';
import 'package:get_template/utils/preference.dart';
import 'package:get_template/utils/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// Platform  Firebase App Id
// web       1:967148231509:web:32b13d8038fa2030fceddc
// android   1:967148231509:android:6ee37c383242bb06fceddc
// ios       1:967148231509:ios:8d9ef37eae48e7aefceddc
// macos     1:967148231509:ios:74477554730657f3fceddc

int id = 0;
DateTime? currentBackPressTime;
Future<void> main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await _configureLocalTimeZone();

  /// Initialize Internet connectivity manger
  await InternetConnectivity().instance();

  /// Initialize Shared Preference
  ///
  await Preference().instance();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColor.transparent));

  runApp(const MyApp());
}

Future<void> _configureLocalTimeZone() async {
  if (kIsWeb || Platform.isLinux) {
    return;
  }
  tz.initializeTimeZones();
  final String timeZoneName = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        bool isUserLoggedIn = Preference.shared.getIsUserLogin();

        bool isUserGetStarted = Preference.shared.getIsGetStarted();
        bool isUserIntroduction = Preference.shared.getIsIntroduction();
        bool isUserSplash = Preference.shared.getIsSplash();
        bool isUserProfileAdded = Preference.shared.getProfileAdded();
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              Utils.isLightTheme() ? Brightness.dark : Brightness.light,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light,
        ));
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          color: AppColor.white,
          themeMode: Utils.isLightTheme() ? ThemeMode.light : ThemeMode.dark,
          locale: getLocale(),
          translations: AppLanguages(),
          fallbackLocale:
              const Locale(Constant.languageEn, Constant.countryCodeEn),
          getPages: AppPages.list,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          defaultTransition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 200),
          initialRoute: isUserSplash
              ? isUserIntroduction
                  ? isUserGetStarted
                      ? isUserLoggedIn
                          ? isUserProfileAdded
                              ? AppRoutes.home
                              : AppRoutes.addOrEditProfile
                          : AppRoutes.signIn
                      : AppRoutes.getStarted
                  : AppRoutes.welcome
              : AppRoutes.splash,
        );
      },
    );
  }
}
