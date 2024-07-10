import 'package:get/get.dart';

import 'package:get_template/ui/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(),
      permanent: true,
    );
   // Get.put(MedicineScreenLogic(), permanent: true);
   // Get.put(JournalScreenLogic(), permanent: true);
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
