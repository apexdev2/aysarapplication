// import 'dart:io';

// import 'package:aysar_app/extensions/sized_box_extension.dart';
// import 'package:aysar_app/helpers/assets_helper.dart';
// import 'package:aysar_app/helpers/image_helper.dart';
// import 'package:aysar_app/helpers/picker_helper.dart';
// import 'package:aysar_app/modules/technical_support/technical_suppotr_getx_controller.dart';
// import 'package:aysar_app/widgets/custom_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class SendMessageBar extends StatefulWidget {
//   SendMessageBar({
//     super.key,
//   });

//   @override
//   State<SendMessageBar> createState() => _SendMessageBarState();
// }

// class _SendMessageBarState extends State<SendMessageBar>
//     with ImageHelper, PickerHelper {
//   final TextEditingController messageController = TextEditingController();

//   File? attachment;

//   @override
//   Widget build(BuildContext context) {
//     return CustomContainer(
//       padding: EdgeInsets.symmetric(horizontal: 10.w),
//       border: Border.all(color: Colors.grey.shade300),
//       child: GetBuilder<TechnicalSuppotrGetxController>(
//         builder: (controller) => Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: messageController,
//                 style: TextStyle(fontSize: 12.sp),
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: "أضف ردك",
//                   hintStyle: TextStyle(
//                     color: const Color(0xffA4B5B2),
//                     fontSize: 11.sp,
//                   ),
//                   suffixIconConstraints:
//                       const BoxConstraints(/*minWidth: 70.w*/),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.r),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.r),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 onSubmitted: (value) {},
//               ),
//             ),
//             10.width,
//             GestureDetector(
//               onTap: () async {
//                 File? file = await pickFile();
//                 if (file != null) {
//                   setState(() {
//                     attachment = file;
//                     messageController.text = "مرفق";
//                   });
//                 }
//               },
//               child: appSvgImage(AssetsHelper.paperclip),
//             ),
//             10.width,
//             Container(
//               decoration: const BoxDecoration(
//                   color: Color(0xff0B629C), shape: BoxShape.circle),
//               child: controller.looadingMessage
//                   ? const Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : GestureDetector(
//                       onTap: () async {
//                         if (messageController.text.isNotEmpty) {
//                           await controller.sendMessageTicket(
//                               id: controller.tickitsDetails!.data!.id!,
//                               attachment: attachment,
//                               content: messageController.text);
//                           messageController.clear();
//                         }
//                       },
//                       child: appSvgImage(AssetsHelper.send),
//                     ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
