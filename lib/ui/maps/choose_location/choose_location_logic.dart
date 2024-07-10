import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ChooseLocationLogic extends GetxController {
  GoogleMapController? mapController;
  Map<MarkerId, Marker> markers = {};
  LatLng? selectedLocation;
  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(37.7749, -122.4194), // Default to San Francisco
    zoom: 14.0,
  );

  @override
  void onInit() {
    super.onInit();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    initialCameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.0,
    );

    mapController
        ?.moveCamera(CameraUpdate.newCameraPosition(initialCameraPosition));

    final marker = Marker(
      markerId: MarkerId('selectedLocation'),
      position: LatLng(position.latitude, position.longitude),
      draggable: true,
      onDragEnd: (LatLng newPosition) {
        selectedLocation = newPosition;
        update();
      },
    );

    markers[MarkerId('selectedLocation')] = marker;
    selectedLocation = LatLng(position.latitude, position.longitude);
    update();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    update();
  }

  void onCameraMove(CameraPosition position) {
    if (markers.containsKey(MarkerId('selectedLocation'))) {
      markers[MarkerId('selectedLocation')] =
          markers[MarkerId('selectedLocation')]!.copyWith(
        positionParam: position.target,
      );
      selectedLocation = position.target;
      update();
    }
  }

  Future<String> getAddressFromLatLng(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      return "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
    }
    return "No address available";
  }

  void onSaveLocation() async {
    if (selectedLocation != null) {
      String address = await getAddressFromLatLng(selectedLocation!);
      Get.back(result: {
        'latLng': selectedLocation,
        'address': address,
      });
    }
  }
}
