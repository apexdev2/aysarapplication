import 'dart:io';
import 'package:aysar_app/extensions/sized_box_extension.dart';
import 'package:aysar_app/helpers/assets_helper.dart';
import 'package:aysar_app/helpers/data_checker.dart';
import 'package:aysar_app/models/id_name_model.dart';
import 'package:aysar_app/modules/maintenance_requests/technical_suppotr_getx_controller.dart';
import 'package:aysar_app/utils/enms.dart';
import 'package:aysar_app/utils/utils.dart';
import 'package:aysar_app/widgets/attachment_section.dart';
import 'package:aysar_app/widgets/custom_container.dart';
import 'package:aysar_app/widgets/my_button.dart';
import 'package:aysar_app/widgets/my_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddNewRequestScreen extends StatefulWidget {
  const AddNewRequestScreen({super.key});

  @override
  State<AddNewRequestScreen> createState() => _AddNewRequestScreenState();
}

class _AddNewRequestScreenState extends State<AddNewRequestScreen>
    with DataCheckerHelper {
  final List<IdNameModel> myrealestate = List.generate(
    3,
    (index) => IdNameModel(id: index, name: "${index + 1} عقار"),
  );
  IdNameModel? selectedRealstate;
  final List<IdNameModel> problemsList = List.generate(
    3,
    (index) => IdNameModel(id: index, name: "${index + 1} مشكلة"),
  );
  IdNameModel? selectedProblem;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          "طلب صيانة",
          style:
              TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<TechnicalSuppotrGetxController>(
        builder: (controller) => Padding(
          padding: EdgeInsets.only(top: 20.h, right: 16.w, left: 16.w),
          child: SingleChildScrollView(
              child: Column(
            children: [
              CustomContainer(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("العقار"),
                    10.height,
                    MyDropDownMenu(
                      fillColor: const Color(0xffF8F8F8),
                      height: 53,
                      radius: 10,
                      hasBorder: true,
                      hint: "اختر العقار",
                      hintColor: Colors.black,
                      item: selectedRealstate,
                      items: myrealestate,

                      //controller.newsCategoryModel?.data ?? [],
                      callBack: (_) {
                        setState(() {
                          selectedRealstate = _;
                        });
                      },
                    ),
                    10.height,
                    const Text("قسم المشكلة"),
                    10.height,
                    MyDropDownMenu(
                      fillColor: const Color(0xffF8F8F8),
                      height: 53,
                      radius: 10,
                      hasBorder: true,
                      hint: "اختر قسم المشكلة",
                      hintColor: Colors.black,
                      item: selectedProblem,
                      items: myrealestate,

                      //controller.newsCategoryModel?.data ?? [],
                      callBack: (_) {
                        setState(() {
                          selectedProblem = _;
                        });
                      },
                    ),
                    10.height,
                    const Text("الوصف "),
                    10.height,
                    TextField(
                      controller: controller.noteController,
                      minLines: 5,
                      maxLines: 6,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "وصف المشكلة",
                        hintStyle: TextStyle(
                          color: const Color(0xffA4B5B2),
                          fontSize: 11.sp,
                        ),
                        suffixIconConstraints:
                            const BoxConstraints(/*minWidth: 70.w*/),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.5)),
                        ),
                        prefixIconConstraints:
                            BoxConstraints(maxHeight: 40.h, maxWidth: 40.w),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.5)),
                        ),
                      ),
                    ),
                    15.height,
                    Text(appLocale.theAttachments),
                    10.height,
                    AttachmentSection(
                      labelText: appLocale.theAttachments,
                      hintText: appLocale.explainRequirements,
                      iconData: AssetsHelper.paperclip,
                      onFileSelected: (File? selectedFile) {
                        // Handle the selected file here
                        if (selectedFile != null) {
                          debugPrint(
                              "Selected file path: ${selectedFile.path}");
                          // You can now use this file in another screen or process it as needed
                          controller.updateAttachments(
                              selectedFile: selectedFile);
                        }
                      },
                    ),
                    25.height,
                    MyButton(
                      text: appLocale.send,
                      loading: false,
                      onTap: () async {
                        Navigator.pop(context);
                        Utils.getSnakBar(
                            type: TosterTypes.sucsses,
                            message: "تم ارسال الطلب بنجاح");
                        // if (controller.checkData) {
                        //   var res = await controller.storeTicket();
                        //   if (res?.status != false) {
                        //     controller.titleController.clear();
                        //     controller.noteController.clear();
                        //     controller.attachment = null;
                        //   }
                        // }
                      },
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
