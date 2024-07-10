import 'package:get/get.dart';
import 'package:get_template/routes/app_routes.dart';
import 'package:get_template/utils/preference.dart';

class SplashScreenLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3)); // Delay for 3 seconds

    bool isUserLoggedIn = Preference.shared.getIsUserLogin();
    bool isUserGetStarted = Preference.shared.getIsGetStarted();
    bool isUserIntroduction = Preference.shared.getIsIntroduction();
    bool isUserProfileAdded = Preference.shared.getProfileAdded();

    String nextRoute = isUserIntroduction
        ? isUserGetStarted
            ? isUserLoggedIn
                ? isUserProfileAdded
                    ? AppRoutes.home
                    : AppRoutes.addOrEditProfile
                : AppRoutes.signIn
            : AppRoutes.getStarted
        : AppRoutes.welcome;

    Get.offAllNamed(nextRoute); // Navigate to the next screen
  }
}
