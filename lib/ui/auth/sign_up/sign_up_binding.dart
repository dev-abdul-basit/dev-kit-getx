import 'package:get/get.dart';
import 'package:get_template/ui/auth/sign_up/sign_up_logic.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpLogic());
  }
}
