import 'package:get/get.dart';
import 'package:get_template/ui/maps/choose_location/choose_location_logic.dart';

class ChooseLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseLocationLogic());
  }
}
