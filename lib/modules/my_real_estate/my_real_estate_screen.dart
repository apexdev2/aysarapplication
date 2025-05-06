import 'package:aysar_app/app/app_routs.dart';
import 'package:aysar_app/extensions/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyRealEstateScreen extends StatelessWidget {
  const MyRealEstateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(appLocale.properties),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 20.h,
          horizontal: 16.w,
        ),
        itemBuilder: (context, index) => buildItem(),
        separatorBuilder: (context, index) => 15.height,
        itemCount: 5,
      ),
    );
  }

  Widget buildItem() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.proparityDetailsScreen),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Project Image
            Container(
              margin: EdgeInsets.all(12.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNFZXe38yVDBAwAMRzwlTrzEv6UhY8RLonCQ&s',
                  height: 141.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Project Info
            Padding(
              padding: EdgeInsets.all(10.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project Title and New Tag
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Project Title
                      Expanded(
                        child: Text(
                          'مشروع مدينة العبور',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff363535),
                          ),
                        ),
                      ),
                      10.width,
                      // New Tag
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: Color(0xff39B6D3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'جديد',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  16.height,

                  // Developer
                  Row(
                    children: [
                      Text(
                        ' المطور :',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                      8.width,
                      Text(
                        'شركة ديار باسا',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  16.height,

                  // Completion Percentage
                  Text(
                    'نسبة إنجاز المشروع :',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),

                  8.height,
                  // Progress Bar

                  LinearPercentIndicator(
                    // width: 140.0,
                    lineHeight: 23.h,
                    percent: 50 / 100,
                    isRTL: true,

                    addAutomaticKeepAlive: true,
                    animateToInitialPercent: true,
                    animation: true,
                    animationDuration: 1500,
                    barRadius: const Radius.circular(15),
                    center: const Text(
                      "50%",
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: const Color(0xffD8D8D8),
                    progressColor: const Color(0xff108CFF),
                  ),
                  8.height,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
