import 'package:aysar_app/helpers/assets_helper.dart';
import 'package:aysar_app/modules/my_account/pages/about_page.dart';
import 'package:aysar_app/modules/my_account/pages/faq_quastion_screen.dart';
import 'package:aysar_app/utils/temp.dart';
import 'package:aysar_app/widgets/custom_container.dart';
import 'package:aysar_app/widgets/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PagesScreen extends StatelessWidget {
  PagesScreen({super.key});
  // final SplashGetxcontroller _splashGetxcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          appLocale.pages,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,
      ),
      body:
          // GetBuilder<PagesGetxcontroller>(
          //   builder: (controller) => controller.isLoading
          //       ? const Center(
          //           child: CircularProgressIndicator(),
          //         )
          //       :
          CustomContainer(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => MyListTile(
            icon: pagesListData[index].icon,
            // assetIcon: true,
            leading: pagesListData[index].title,
            onTap: () {
              if (pagesListData[index].type == "faq") {
                // controller.getFAQ();
                Get.to(() => const FaqQuastionScreen());
              } else {
                // _splashGetxcontroller.showPage(
                //     type:
                //         pagesListData[index].type ?? '');
                Get.to(
                  () => AboutPage(
                      appbarTitle: pagesListData[index].title,
                      description: pagesListData[index].description),
                );
              }
            },
            divider: false,
          ),
          separatorBuilder: (context, index) => Divider(
            height: 0,
            thickness: 0.5,
            color: Theme.of(context).hintColor.withOpacity(0.2),
          ),
          itemCount: pagesListData.length,
        ),
      ),
      // ),
    );
  }
}

List<PagesModeltest> pagesListData = [
  PagesModeltest(
      title: "من نحن",
      description: tempLongString(length: 50),
      icon: AssetsHelper.aboutIcon,
      type: "page"),
  PagesModeltest(
      title: "سياسة الخصوصية",
      description: tempLongString(length: 100),
      icon: AssetsHelper.privecyIcon,
      type: "page"),
  PagesModeltest(
      title: "الأسئلة الشائعة",
      description: tempLongString(length: 60),
      icon: AssetsHelper.faqIcon,
      type: "faq"),
];

class PagesModeltest {
  final String title;
  final String description;
  final String icon;
  final String type;

  PagesModeltest(
      {required this.title,
      required this.description,
      required this.icon,
      required this.type});
}
