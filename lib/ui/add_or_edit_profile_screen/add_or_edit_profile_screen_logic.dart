import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../Widgets/pick_from_dialog.dart';
import '../../connectivity_manager/connectivity_manager.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant.dart';
import '../../utils/debug.dart';
import '../../utils/preference.dart';
import '../../utils/utils.dart';
import '../home/home_binding.dart';
import '../home/home_controller.dart';

class AddOrEditProfileScreenLogic extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userBirthDateController = TextEditingController();
  TextEditingController userAgeController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

   String? selectedGender = Constant.genderList[0];
  //String? selectedGender;

  String? selectedBloodGroup;
  DateTime? birthDate = DateTime.now();

  bool isShowProgress = false;
  bool isEdit = false;
  var data = Get.parameters;

  //TODO:
  // UserTable? userData;

  final ImagePicker _picker = ImagePicker();
  XFile? pickedNewFile;
  String? profileUrl;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    isEdit = data[Constant.idIsEditProfile] == 'true';
    // await setDataForEdit();
    update();
  }

  // @override
  // Future<void> onReady() async {
  //   // TODO: implement onReady
  //   super.onReady();
  //
  // }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> selectBirthDate() async {
    Utils.unFocusKeyboard();
    final DateTime currentDate = DateTime.now();

// Ensure startDate is not before the current date
    birthDate ??= currentDate;

    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: birthDate!,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: sampleDatePickerThemeData,
            colorScheme: ColorScheme.light(
              primary: Get.theme.colorScheme.primary,
              onPrimary: Get.theme.colorScheme.surfaceVariant,
              onSurface: Get.theme.colorScheme.onPrimaryContainer,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    Get.theme.colorScheme.primary, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != birthDate) {
      birthDate = picked;
      userBirthDateController.text =
          DateFormat('d MMM, yyyy').format(birthDate!);
      userAgeController.text = daysBetween(birthDate!);
      update([Constant.idUserBirthDateInput, Constant.idUserAgeInput]);
    }
  }

  String daysBetween(DateTime from) {
    DateTime birthdate = DateTime(from.year, from.month, from.day);
    Duration difference = DateTime.now().difference(birthdate);

    int years = difference.inDays ~/ 365;
    int months = (difference.inDays % 365) ~/ 30;
    return '$years years and $months months';
  }

  DatePickerThemeData sampleDatePickerThemeData = DatePickerThemeData(
    headerBackgroundColor: Get.theme.colorScheme.primary,
    headerForegroundColor: Get.theme.colorScheme.onSurfaceVariant,
    headerHeadlineStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Get.theme.colorScheme.onSurfaceVariant,
    ),
    headerHelpStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.normal,
      color: Get.theme.colorScheme.onSurfaceVariant,
    ),
    yearOverlayColor: MaterialStateProperty.all<Color>(Colors.blue[100]!),
    weekdayStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Get.theme.colorScheme.onSurfaceVariant),
    shadowColor: Colors.grey[300],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    surfaceTintColor: Colors.white,
  );

  Future<bool> requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      Get.snackbar(
        'Permission Denied',
        'Location permission is required to use this feature.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else if (status.isPermanentlyDenied) {
      Get.snackbar(
        'Permission Permanently Denied',
        'Please enable location permission from settings.',
        snackPosition: SnackPosition.BOTTOM,
      );
      openAppSettings();
      return false;
    }
    return false;
  }

  //
  // Future<void> submitData(BuildContext context) async {
  //   if (!await InternetConnectivity.isInternetConnect(Get.context!)) {
  //     Utils.showToast(null, "txtCheckYourInternetConnectivity".tr);
  //     return;
  //   }
  //   if (formKey.currentState!.validate()) {
  //     try {
  //       isShowProgress = true;
  //       update([Constant.idProVersionProgress]);
  //       var storageRef = FirebaseStorage.instance
  //           .ref()
  //           .child('member_images/${userEmailController.text.trim()}.jpg');
  //       UploadTask uploadTask;
  //       String? downloadUrl;
  //       if (pickedNewFile != null) {
  //         uploadTask = storageRef.putFile(File(pickedNewFile!.path));
  //         downloadUrl = await (await uploadTask).ref.getDownloadURL();
  //       }
  //       UserTable userTable = UserTable(
  //         uId: isEdit ? userData!.uId : null,
  //         email: userEmailController.text.trim(),
  //         name: userNameController.text,
  //         fcmToken: Utils.getFcmToken(),
  //         gender: selectedGender,
  //         birthDate: userBirthDateController.text,
  //         age: userAgeController.text,
  //         bloodGroup: selectedBloodGroup,
  //         phoneNumber: userPhoneController.text,
  //         profileImage: downloadUrl,
  //         address: addressController.text,
  //       );
  //
  //       if (isEdit) {
  //         DataBaseHelper.instance.updateUser(userTable);
  //
  //         if (await InternetConnectivity.isInternetConnect(Get.context!)) {
  //           await FireStoreHelper().addUser(userTable);
  //         }
  //
  //
  //         if (await InternetConnectivity.isInternetConnect(Get.context!)) {
  //           await FireStoreHelper().addOrUpdateFamilyMember(familyMemberTable);
  //         }
  //
  //         isShowProgress = false;
  //         update([Constant.idProVersionProgress]);
  //         Preference.shared.setProfileAdded(true);
  //         Utils.showToast(Get.context!, 'txtProfileIsUpdatedSuccessfully'.tr);
  //         //TODO:
  //        // Get.find<HomeController>().getUserData();
  //         Get.find<HomeController>()
  //             .onTabSelected(Get.find<HomeController>().selectedTabIndex);
  //         // Get.find<AppointmentScreenLogic>().update([
  //         //   Constant.idHome,
  //         //   Constant.idAppointmentList,
  //         //   Constant.idAppointmentScreenTab
  //         // ]);
  //
  //         Get.forceAppUpdate();
  //         Get.offNamedUntil(
  //             AppRoutes.home, ModalRoute.withName(AppRoutes.home));
  //       } else {
  //         int userId = await DataBaseHelper.instance.insertUser(userTable);
  //         userTable.uId = userId;
  //
  //         if (await InternetConnectivity.isInternetConnect(Get.context!)) {
  //           await FireStoreHelper().addUser(userTable);
  //         }
  //
  //         int familyMemberId = await DataBaseHelper.instance
  //             .insertFamilyMember(familyMemberTable);
  //         familyMemberTable.fId = familyMemberId;
  //
  //         if (await InternetConnectivity.isInternetConnect(Get.context!)) {
  //
  //           await FireStoreHelper().onSync();
  //         }
  //
  //         isShowProgress = false;
  //         update([Constant.idProVersionProgress]);
  //         Preference.shared.setIsUserLogin(true);
  //         Preference.shared.setProfileAdded(true);
  //         Utils.showToast(Get.context!, 'txtProfileIsAddedSuccessfully'.tr);
  //         HomeBinding().dependencies();
  //         Get.find<HomeController>().onTabSelected(0);
  //         Get.offAllNamed(AppRoutes.home,
  //             parameters: {Constant.idIsFromLogIn: "true"});
  //       }
  //     } catch (e) {
  //       isShowProgress = false;
  //       update([Constant.idProVersionProgress]);
  //       Debug.printLog(":::::${e.toString()}");
  //     }
  //   }
  // }
  //
  // Future<void> setDataForEdit() async {
  //   if (isEdit) {
  //     await DataBaseHelper.instance
  //         .getUserData(Preference.shared.getString(Preference.firebaseEmail))
  //         .then((value) {
  //       if (value.isEmpty) return;
  //       userData = value.first;
  //       userNameController.text = userData!.name!;
  //       userBirthDateController.text = userData!.birthDate ?? '';
  //       if (userData!.birthDate != null && userData!.birthDate!.isNotEmpty) {
  //         birthDate = DateFormat('d MMM, yyyy').parse(userData!.birthDate!);
  //       }
  //       userAgeController.text = userData!.age ?? '';
  //       userPhoneController.text = userData!.phoneNumber ?? '';
  //       addressController.text = userData!.address ?? '';
  //       selectedGender = userData!.gender;
  //       selectedBloodGroup = userData!.bloodGroup;
  //       profileUrl = userData!.profileImage;
  //       userEmailController.text =
  //           Preference.shared.getString(Preference.firebaseEmail) ?? '';
  //       Debug.printLog(":::::${selectedGender.toString()}");
  //       Debug.printLog(":::::${selectedBloodGroup.toString()}");
  //       update([
  //         Constant.idSelectGender,
  //         Constant.idProfilePhoto
  //       ]);
  //     });
  //   }
  //   userEmailController.text =
  //       Preference.shared.getString(Preference.firebaseEmail) ?? '';
  // }

  openImagePickerDialog() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: Get.context!,
        builder: (context) => PickFormDialog(
              title: 'txtPickImage'.tr,
              onTapGallery: () => pickImage(ImageSource.gallery),
              onTapCamera: () => pickImage(ImageSource.camera),
            ));
  }

  pickImage(ImageSource source) async {
    Get.back();
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 50,
    );
    pickedNewFile = pickedFile;
    profileUrl = null;
    update([Constant.idProfilePhoto]);
  }
}
