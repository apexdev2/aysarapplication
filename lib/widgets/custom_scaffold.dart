// import 'package:aysar_app/app/app_routs.dart';
// import 'package:aysar_app/extensions/sized_box_extension.dart';
// import 'package:aysar_app/helpers/alert_dialogs_helper.dart';
// import 'package:aysar_app/helpers/assets_helper.dart';
// import 'package:aysar_app/helpers/image_helper.dart';
// import 'package:aysar_app/modules/notifcation/app_notification_icon.dart';
// import 'package:aysar_app/modules/profile/profile_getxcontroller.dart';
// import 'package:aysar_app/modules/reservations/home/search_reservation_controller.dart';
// import 'package:aysar_app/widgets/my_button.dart';
// import 'package:aysar_app/widgets/search_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class CustomScaffold extends StatefulWidget {
//   const CustomScaffold({
//     super.key,
//     required this.body,
//     this.appbarTitle,
//     this.withBack = true,
//     this.withLang = false,
//     this.withAction = false,
//     this.backRoute,
//     this.ishome = false,
//     this.bottomNavigationBar,
//     this.floatingActionButton,
//     this.actionWidget,
//     this.fontsize,
//     this.appbarWidget,
//     this.extendBodyBehindAppBar = true,
//   });
//   final bool? withBack;
//   final bool? withLang;
//   final bool? withAction;
//   final Widget? bottomNavigationBar;
//   final Widget? actionWidget;
//   final String? appbarTitle;
//   final double? fontsize;
//   final bool? ishome;
//   final String? backRoute;
//   final Widget? floatingActionButton;
//   final Widget body;
//   final Widget? appbarWidget;
//   final bool? extendBodyBehindAppBar;
//   @override
//   State<CustomScaffold> createState() => _CustomScaffoldState();
// }

// class _CustomScaffoldState extends State<CustomScaffold>
//     with ImageHelper, AlertDialogsHelper {
//   AppLocalizations get appLocale => AppLocalizations.of(context)!;
//   late TextEditingController searchController;
//   @override
//   void initState() {
//     searchController = TextEditingController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: widget.extendBodyBehindAppBar ?? false,
//       bottomNavigationBar: widget.bottomNavigationBar ?? empty,
//       backgroundColor: Colors.white,
//       floatingActionButton: widget.floatingActionButton ?? empty,
//       appBar: widget.ishome!
//           ? PreferredSize(
//               preferredSize: Size(double.infinity, 102.h),
//               child: Container(
//                 padding: EdgeInsets.only(top: 45.h, right: 16.w, left: 16.w),
//                 decoration: BoxDecoration(color: Colors.white, boxShadow: [
//                   BoxShadow(
//                     color: Colors.black
//                         .withOpacity(0.1), // Shadow color with transparency
//                     blurRadius: 4, // Softness of the shadow
//                     offset:
//                         const Offset(0, 1), // Horizontal and vertical offset
//                   ),
//                 ]),
//                 child: _infoWidget(),
//               ),
//             )
//           : AppBar(
//               toolbarHeight: 103.h,
//               centerTitle: true,
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               foregroundColor: Colors.red,
//               forceMaterialTransparency: false,
//               scrolledUnderElevation: 0,
//               title: Text(
//                 widget.appbarTitle ?? "",
//                 style: TextStyle(
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Theme.of(context).primaryColor),
//               ),
//               leadingWidth: 100.w,
//               automaticallyImplyLeading: false,
//               leading: widget.withBack! ? _backButton(widget.backRoute) : empty,
//             ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 'assets/images/scaffoldBg.png'), // Path to your image
//             fit: BoxFit.cover, // Adjusts the image to cover the whole screen
//           ),
//         ),
//         child: widget.body,
//       ),
//     );
//   }

//   Widget _infoWidget() {
//     return GestureDetector(
//       onTap: () {
//         // Get.find<ProfileGetxController>().getMyProfile();
//         // Get.toNamed(Routes.profileScreen);
//       },
//       child: GetBuilder<ProfileGetxcontroller>(
//         builder: (controller) => Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: 56.h,
//               width: 56.w,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(40),
//                 child: appCachedImage(
//                     controller.profileModel?.data?.image ?? "",
//                     fit: BoxFit.cover),
//               ),
//             ),
//             10.width,
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       appLocale.welcomeMessage,
//                       style: TextStyle(
//                         color: Theme.of(context).primaryColor,
//                         fontSize: 14.sp,
//                       ),
//                     ),
//                     5.width,
//                     appSvgImage(AssetsHelper.hand),
//                   ],
//                 ),
//                 5.height,
//                 Text(
//                   controller.profileModel?.data?.name ?? "",
//                   style: TextStyle(
//                     color: Theme.of(context).hintColor,
//                     fontSize: 12.sp,
//                   ),
//                 )
//               ],
//             ),
//             const Spacer(),
//             GestureDetector(
//               onTap: () => _openSearchDialog(
//                 context: context,
//               ),
//               child: Container(
//                 height: 35.h,
//                 width: 35.h,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.rectangle,
//                   borderRadius: BorderRadius.circular(13.r),
//                   border: Border.all(color: Colors.grey.shade300),
//                 ),
//                 child: appSvgImage(
//                   AssetsHelper.search,
//                   // width: 13.w,
//                 ),
//               ),
//             ),
//             10.width,
//             const AppNotificationIcon(),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget _buildLanguageSelector() {
//   //   return GetBuilder<LanguageGetxController>(
//   //     builder: (controller) => LanguageChanger(
//   //       child: Container(
//   //         // width: 50.w,
//   //         padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
//   //         decoration: BoxDecoration(
//   //           // color: const Color(0xffF5F5F7),
//   //           borderRadius: BorderRadius.circular(50.r),
//   //         ),
//   //         child: Row(
//   //           mainAxisSize: MainAxisSize.min,
//   //           children: [
//   //             Container(
//   //                 height: 20.h,
//   //                 width: 20.h,
//   //                 clipBehavior: Clip.antiAlias,
//   //                 decoration: const BoxDecoration(shape: BoxShape.circle),
//   //                 child: Container(
//   //                   decoration: BoxDecoration(
//   //                     shape: BoxShape.circle,
//   //                     image: DecorationImage(
//   //                         image: AssetImage(
//   //                           controller.lang == 'ar'
//   //                               ? AssetsHelper.omanFlag
//   //                               : AssetsHelper.usflag,
//   //                         ),
//   //                         fit: BoxFit.fill),
//   //                   ),
//   //                 )),
//   //             5.width,
//   //             Text(
//   //               controller.lang == 'ar' ? "Ar" : "En",
//   //               style: TextStyle(
//   //                   fontSize: 12.sp,
//   //                   fontWeight: FontWeight.w500,
//   //                   color: Colors.white),
//   //             ),
//   //             5.width,
//   //             Icon(
//   //               Icons.keyboard_arrow_down_outlined,
//   //               size: 22.w,
//   //               color: Colors.white,
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   Widget _backButton(String? backRoute) {
//     return GestureDetector(
//       onTap: () => backRoute != null ? Get.toNamed(backRoute) : Get.back(),
//       child: Padding(
//         padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
//         child: SizedBox(
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(
//                 Icons.arrow_back_ios,
//                 color: Theme.of(context).primaryColor,
//                 size: 15,
//               ),
//               Text(
//                 appLocale.back,
//                 style: TextStyle(color: Theme.of(context).primaryColor),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _openSearchDialog(
//       {required BuildContext? context, Color? titleColor, Function()? onTap}) {
//     return alertDialogTemplate(
//       context!,
//       backgroundColor: Colors.white,
//       showClose: true,
//       body: StatefulBuilder(
//         builder: (context, newState) => Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               appLocale.search,
//               style: TextStyle(
//                   color: titleColor ?? Theme.of(context).primaryColor,
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w500),
//             ),
//             10.height,
//             MySearchBar(
//               hint: appLocale.client_details,
//               searchController: searchController,
//               icon: AssetsHelper.search,
//               witFilter: false,
//               // borderSide: BorderSide(color: Colors.grey.shade400),
//             ),
//             10.height,
//             MyButton(
//               text: appLocale.search,
//               onTap: onTap ??
//                   () async {
//                     await Get.find<SearchReservationController>()
//                         .updateSearchText(search: searchController.text);
//                     Get.find<SearchReservationController>()
//                         .searchReservations();

//                     Get.back();
//                     await Get.toNamed(
//                       Routes.searchResultScreen,
//                     );
//                     searchController.clear();
//                   },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
