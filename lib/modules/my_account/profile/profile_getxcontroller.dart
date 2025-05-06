import 'dart:io';


import 'package:aysar_app/widgets/countries.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileGetxcontroller extends GetxController {
  @override
  void onInit() {
    // getMyProfile();
    super.onInit();
  }

  bool isLoading = false;
  // ProfileModel? profileModel;
  AppIntlCountry? selectedIntlCountry;
  File? profileImage;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  // getMyProfile() async {
  //   isLoading = true;
  //   update();
  //   profileModel = await ProfileRepo().getMyProfile();
  //   if (profileModel?.status != false) {
  //     await initializedProfileControlers(profileModel);
  //   }
  //   isLoading = false;
  //   update();
  // }

  // initializedProfileControlers(ProfileModel? profileModel) async {
  //   emailcontroller =
  //       TextEditingController(text: profileModel?.data?.email ?? "");
  //   namecontroller =
  //       TextEditingController(text: profileModel?.data?.name ?? "");
  //   mobileController =
  //       TextEditingController(text: profileModel?.data?.mobile ?? "");
  // }

  updateProfileImage({required File? image}) {
    profileImage = image;
    update();
  }

  updateSelectedIntlCountry({required AppIntlCountry? intlCountry}) {
    selectedIntlCountry = intlCountry;
    update();
  }

  // BaseApiResponce? _baseApiResponse;

  // activateNotification({required int activatestatuse}) async {
  //   isLoading = true;
  //   update();
  //   _baseApiResponse = await ShareedRepo()
  //       .activateNotification(activatestatuse: activatestatuse);
  //   if (_baseApiResponse?.status != false) {
  //     getMyProfile();
  //   }
  //   isLoading = false;
  //   update();
  // }
}
