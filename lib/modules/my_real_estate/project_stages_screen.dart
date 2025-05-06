import 'package:aysar_app/extensions/sized_box_extension.dart';
import 'package:aysar_app/helpers/image_helper.dart';
import 'package:aysar_app/modules/my_real_estate/status_item.dart';
import 'package:aysar_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProjectStagesScreen extends StatelessWidget with ImageHelper {
  const ProjectStagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
// Status items data
    final List<Map<String, dynamic>> statusItems = [
      {
        'title': 'مرحلة الحجز',
        'percentage': '20%',
        'description': 'الحجز المبدئي',
        'color': Colors.green.shade200,
        'status': 'منتهية',
        'statusColor': Colors.green,
      },
      {
        'title': 'مرحلة المساعدات',
        'percentage': '10%',
        'description': 'موافقة الجهات المعنية',
        'color': Colors.grey.shade400,
        'status': 'قيد التنفيذ',
        'statusColor': Colors.transparent,
      },
      {
        'title': 'مرحلة الدفعة',
        'percentage': '30%',
        'description': 'الدفعة الأولى',
        'color': Colors.yellow.shade200,
        'status': 'متأخر',
        'statusColor': Colors.amber,
      },
      {
        'title': 'مرحلة التخصيص',
        'percentage': '10%',
        'description': 'تخصيص الوحدات',
        'color': Colors.red.shade200,
        'status': 'ملغي',
        'statusColor': Colors.red,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          "مراحل المشروع",
          style:
              TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomContainer(
                padding: EdgeInsets.all(10.w),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      percent: 70 / 100,
                      isRTL: true,

                      addAutomaticKeepAlive: true,
                      animateToInitialPercent: true,
                      animation: true,
                      animationDuration: 1500,
                      barRadius: const Radius.circular(15),
                      center: const Text(
                        "70%",
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: const Color(0xffD8D8D8),
                      progressColor: const Color(0xff108CFF),
                    ),
                  ],
                ),
              ),
              20.height,

// Status items
              CustomContainer(
                color: Colors.white,
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'مراحل المشروع :',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                    10.height,
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) =>
                            StatusItem(item: statusItems[index]),
                        separatorBuilder: (context, index) => 10.height,
                        itemCount: statusItems.length),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
