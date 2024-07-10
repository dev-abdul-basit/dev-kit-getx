import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get_template/ui/maps/choose_location/choose_location_logic.dart';

import '../../../Widgets/common_appbar.dart';

class ChooseLocationViewPage extends StatelessWidget {
  const ChooseLocationViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ChooseLocationLogic>();

    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      appBar: CommonAppBar(title: 'txtSelectYourLocation'.tr),
      body: GetBuilder<ChooseLocationLogic>(
        init: ChooseLocationLogic(),
        builder: (logic) {
          return GoogleMap(
            initialCameraPosition: logic.initialCameraPosition,
            onMapCreated: logic.onMapCreated,
            markers: Set<Marker>.of(logic.markers.values),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onCameraMove: logic.onCameraMove,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         // Get.back(result: logic.selectedLocation);
          logic.onSaveLocation();
        },
        child: Icon(
          Icons.check,
          color: Get.theme.colorScheme.background,
        ),
      ),
    );
  }
}
