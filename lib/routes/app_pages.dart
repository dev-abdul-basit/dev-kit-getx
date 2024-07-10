import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_template/ui/add_or_edit_profile_screen/add_or_edit_profile_screen_binding.dart';
import 'package:get_template/ui/add_or_edit_profile_screen/add_or_edit_profile_screen_view.dart';
import 'package:get_template/ui/auth/social_login_screen/social_login_binding.dart';
import 'package:get_template/ui/auth/social_login_screen/social_login_logic.dart';
import 'package:get_template/ui/auth/social_login_screen/social_login_view.dart';
import 'package:get_template/ui/change_language/change_language_binding.dart';
import 'package:get_template/ui/change_language/change_language_screen.dart';
import 'package:get_template/ui/forgot_password_screen/forgot_password_screen_binding.dart';
import 'package:get_template/ui/forgot_password_screen/forgot_password_screen_view.dart';
import 'package:get_template/ui/get_started_screens/get_started_screen_binding.dart';
import 'package:get_template/ui/get_started_screens/get_started_screen_view.dart';
import 'package:get_template/ui/home/home_binding.dart';
import 'package:get_template/ui/home/home_screens.dart';
import 'package:get_template/ui/maps/choose_location/choose_location_binding.dart';
import 'package:get_template/ui/maps/choose_location/choose_location_view.dart';
import 'package:get_template/ui/welcome_screen/welcome_binding.dart';
import 'package:get_template/ui/welcome_screen/welcome_view.dart';
import 'package:get_template/ui/setting/setting_screen_binding.dart';
import 'package:get_template/ui/setting/setting_screen_view.dart';
import 'package:get_template/ui/auth/sign_in/sign_in_binding.dart';
import 'package:get_template/ui/auth/sign_in/sign_in_screens.dart';
import 'package:get_template/ui/auth/sign_up/sign_up_binding.dart';
import 'package:get_template/ui/auth/sign_up/sign_up_view.dart';
import 'package:get_template/ui/splashscreen/splash_binding.dart';
import 'package:get_template/ui/splashscreen/splash_view.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashViewPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeScreenPage(),
      binding: WelcomeScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.getStarted,
      page: () => GetStartedScreenPage(),
      binding: GetStartedScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.socialLogin,
      page: () => SocialLoginScreenView(),
      binding: SocialLoginScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreenPage(),
      binding: ForgotPasswordScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.addOrEditProfile,
      page: () => const AddOrEditProfileScreenPage(),
      binding: AddOrEditProfileScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => const SettingScreenPage(),
      binding: SettingScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.changeLanguage,
      page: () => ChangeLanguageScreen(),
      binding: ChangeLanguageBinding(),
    ),
    GetPage(
      name: AppRoutes.chooseLocation,
      page: () =>const  ChooseLocationViewPage(),
      binding: ChooseLocationBinding(),
    ),
  ];
}
