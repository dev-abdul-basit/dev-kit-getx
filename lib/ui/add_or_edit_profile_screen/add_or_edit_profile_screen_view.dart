import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get_template/Widgets/common_appbar.dart';
import 'package:get_template/Widgets/progress_dialog.dart';
import 'package:get_template/ui/maps/choose_location/choose_location_view.dart';

import 'package:get_template/utils/constant.dart';

import '../../Widgets/add_success_dialoge.dart';
import '../../Widgets/common_button_one.dart';
import '../../Widgets/common_text.dart';
import '../../Widgets/text_form_field.dart';
import '../../generated/assets.dart';
import '../../routes/app_routes.dart';
import '../../utils/sizer_utils.dart';
import 'add_or_edit_profile_screen_logic.dart';

class AddOrEditProfileScreenPage extends StatelessWidget {
  const AddOrEditProfileScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AddOrEditProfileScreenLogic>();

    return Stack(
      children: [
        Scaffold(
            backgroundColor: Get.theme.colorScheme.background,
            appBar: CommonAppBar(title: 'txtProfile'.tr),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      GetBuilder<AddOrEditProfileScreenLogic>(
                          id: Constant.idProfilePhoto,
                          builder: (logic) {
                            return Container(
                              width: AppSizes.height_20,
                              height: AppSizes.height_20,
                              padding: EdgeInsets.all(
                                  logic.profileUrl != null ? 0 : 50),
                              margin: const EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: logic.pickedNewFile != null
                                      ? DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                              File(logic.pickedNewFile!.path)))
                                      : null,
                                  color: Get.theme.colorScheme.primary),
                              child: logic.profileUrl != null
                                  ? CachedNetworkImage(
                                      imageUrl: logic.profileUrl!,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          Image.asset(
                                        Assets.imagesImgUserMale,
                                        color: Colors.white,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        Assets.imagesImgUserMale,
                                        color: Colors.white,
                                      ),
                                    )
                                  : logic.pickedNewFile != null
                                      ? const SizedBox()
                                      : Image.asset(
                                          Assets.imagesImgUserMale,
                                          color: Colors.white,
                                        ),
                            );
                          }),
                      PositionedDirectional(
                        bottom: 1,
                        end: 1,
                        child: InkWell(
                          onTap: () => logic.openImagePickerDialog(),
                          child: Container(
                            width: AppSizes.height_5_5,
                            height: AppSizes.height_5_5,
                            padding: const EdgeInsets.all(11),
                            margin: const EdgeInsets.all(26),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Get.theme.colorScheme.background,
                                    width: 4),
                                shape: BoxShape.circle,
                                color: Get.theme.colorScheme.onSecondary),
                            child: SvgPicture.asset(Assets.iconsIcCamera,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: logic.formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GetBuilder<AddOrEditProfileScreenLogic>(
                              id: Constant.idUserNameInput,
                              builder: (logic) {
                                return CommonTextFormFieldWithSuffix(
                                  readOnly: false,
                                  controller: logic.userNameController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[a-z A-Z á-ú Á-Ú 0-9]")),
                                  ],
                                  hintText: '${'txtEnterUserName'.tr} *',
                                  fillColor:
                                      Get.theme.colorScheme.surfaceVariant,
                                  //  prefixIcon: Assets.iconsIcUserName,
                                  shouldValidate: true,
                                  validatorText: 'txtEnterUserName'.tr,
                                );
                              }),
                          SizedBox(
                            height: AppSizes.height_2_7,
                          ),
                          CommonText(
                            text: 'txtSelectGender'.tr,
                            textColor: Get.theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.w400,
                            fontSize: AppFontSize.size_12,
                          ),
                          Center(
                            child: GetBuilder<AddOrEditProfileScreenLogic>(
                              id: Constant.idSelectGender,
                              builder: (logic) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: Constant.genderList.map((gender) {
                                    return Row(
                                      children: [
                                        Radio<String>(
                                          fillColor: WidgetStateColor.resolveWith((states) => Get.theme.colorScheme.primary),
                                          focusColor: WidgetStateColor.resolveWith((states) => Get.theme.colorScheme.primary),
                                          value: gender,
                                          groupValue: logic.selectedGender,
                                          onChanged: (value) {
                                            logic.selectedGender = value!;
                                            logic.update([Constant.idSelectGender]);
                                          },
                                        ),
                                        Text(gender.tr),
                                        SizedBox(width: AppSizes.width_4),

                                      ],
                                    );
                                  }).toList(),
                                );
                              },
                            ),

                          ),
                          SizedBox(
                            height: AppSizes.height_2_7,
                          ),
                          GetBuilder<AddOrEditProfileScreenLogic>(
                              id: Constant.idUserBirthDateInput,
                              builder: (logic) {
                                return CommonTextFormFieldWithSuffix(
                                  onTap: logic.selectBirthDate,
                                  readOnly: true,
                                  controller: logic.userBirthDateController,
                                  hintText: 'txtEnterYourBirthDate'.tr,
                                  fillColor:
                                      Get.theme.colorScheme.surfaceVariant,
                                  //prefixIcon: Assets.iconsIcCalendar,
                                  validatorText: 'txtEnterYourBirthDate'.tr,
                                );
                              }),
                          SizedBox(
                            height: AppSizes.height_2_7,
                          ),
                          GetBuilder<AddOrEditProfileScreenLogic>(
                              id: Constant.idUserAgeInput,
                              builder: (logic) {
                                return CommonTextFormFieldWithSuffix(
                                  onTap: logic.selectBirthDate,
                                  readOnly: true,
                                  controller: logic.userAgeController,
                                  hintText: 'txtAge'.tr,
                                  fillColor:
                                      Get.theme.colorScheme.surfaceVariant,
                                  //prefixIcon: Assets.iconsIcAge,
                                  validatorText: 'txtEnterYourBirthDate'.tr,
                                );
                              }),
                          SizedBox(
                            height: AppSizes.height_2_7,
                          ),
                          GetBuilder<AddOrEditProfileScreenLogic>(
                              id: Constant.idUserEmail,
                              builder: (logic) {
                                return CommonTextFormFieldWithSuffix(
                                  readOnly: true,
                                  controller: logic.userEmailController,
                                  hintText: 'txtEnterYourEmail'.tr,
                                  validatorType: Constant.validationTypeEmail,
                                  fillColor:
                                      Get.theme.colorScheme.surfaceVariant,
                                  // prefixIcon: Assets.iconsIcMessage,
                                  validatorText: 'txtEnterYourEmail'.tr,
                                );
                              }),
                          SizedBox(
                            height: AppSizes.height_2_7,
                          ),
                          GetBuilder<AddOrEditProfileScreenLogic>(
                              id: Constant.idUserPhone,
                              builder: (logic) {
                                return CommonTextFormFieldWithSuffix(
                                  readOnly: false,
                                  controller: logic.userPhoneController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  hintText: 'txtEnterYourPhoneNumber'.tr,
                                  // validatorType: Constant.validationTypePhone,
                                  fillColor:
                                      Get.theme.colorScheme.surfaceVariant,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 15,
                                  //prefixIcon: Assets.iconsIcPhone,
                                  // validatorText: 'txtEnterValidPhoneNumber'.tr,
                                );
                              }),
                          SizedBox(
                            height: AppSizes.height_2_7,
                          ),


                          GetBuilder<AddOrEditProfileScreenLogic>(
                              id: Constant.idUserAddress,
                              builder: (logic) {
                                return CommonTextFormFieldWithSuffix(
                                  readOnly: true,
                                  controller: logic.addressController,
                                  hintText: 'txtEnterYourAddress'.tr,
                                  fillColor: Get.theme.colorScheme.surfaceVariant,
                                  maxLines: 2,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9 , . -]")),
                                  ],
                                  validatorText: 'txtEnterYourAddress'.tr,
                                  onTap: () async {
                                    final result = await Get.toNamed(AppRoutes.chooseLocation);
                                    if (result != null) {
                                     // LatLng? latLng = result['latLng'];
                                      String? address = result['address'];
                                      if (address != null) {
                                        logic.addressController.text = address; // Display the address
                                     //   logic.selectedLatLng = latLng; // Store the LatLng
                                        logic.update([Constant.idUserAddress]);
                                      }
                                    }
                                  },
                                );
                              }
                          ),


                          SizedBox(
                            height: AppSizes.height_4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CommonButtonOne(
                                  onTap: () {
                                    Get.back();
                                  },
                                  backgroundColor:
                                      Get.theme.colorScheme.background,
                                  text: 'txtCancel'.tr),
                              SizedBox(
                                width: AppSizes.height_2,
                              ),
                              CommonButtonOne(
                                  onTap: () {
                                    //logic.submitData(context);

                                  },
                                  text: logic.isEdit
                                      ? 'txtUpdateNow'.tr
                                      : 'txtSave'.tr),
                            ],
                          ),
                          SizedBox(
                            height: AppSizes.height_4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
        GetBuilder<AddOrEditProfileScreenLogic>(
          id: Constant.idProVersionProgress,
          builder: (logic) {
            return ProgressDialog(
              inAsyncCall: logic.isShowProgress,
              child: const SizedBox(),
            );
          },
        ),
      ],
    );
  }
}
