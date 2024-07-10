import 'package:get/get.dart';
import 'package:get_template/ui/auth/social_login_screen/social_login_logic.dart';

class SocialLoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SocialLoginScreenLogic());
  }
}
