import 'package:aysar_app/app/app_routs.dart';
import 'package:aysar_app/extensions/sized_box_extension.dart';
import 'package:aysar_app/helpers/image_helper.dart';
import 'package:aysar_app/utils/temp.dart';
import 'package:aysar_app/widgets/custom_container.dart';
import 'package:aysar_app/widgets/icon_title_builder.dart';
import 'package:aysar_app/widgets/info_widget.dart';
import 'package:aysar_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProparityDetailsScreen extends StatelessWidget with ImageHelper {
  const ProparityDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          appLocale.details,
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 275.h,
                child: Column(
                  children: [
                    Container(
                      height: 141.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                        child: appCachedImage(tempImage, fit: BoxFit.cover),
                      ),
                    ),
                    // Row of Smaller Images
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (context, index) => 10.width,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            border: Border.all(width: 0.5, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: appCachedImage(
                              fit: BoxFit.cover,
                              height: 90.h,
                              width: 90.w,
                              tempImage,
                            ),
                          ),
                        ),
                      ),
                    ),
                
                  ],
                ),
              ),
              15.height,
              CustomContainer(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                borderRadius: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "مشروع مدينة العبور عمارة  E6",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff363535),
                      ),
                    ),
                    25.height,
                    Text(
                      appLocale.addressDetails,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400),
                    ),
                    10.height,
                    Text(
                      "يقع المشروع في حي النهضة بمدينة الرياض ",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    Text(
                      "مطور العقار ",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400),
                    ),
                    15.height,
                    InfoWidget(
                      image: tempImage2,
                      mobile: "966123456",
                      name: "شركة ديار ناسا ",
                      onTap: () {},
                      email: "info@mail.com",
                    ),
                    15.height,
                    Text(
                      "وصف العقار",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400),
                    ),
                    Text(
                      """
هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،
 لقد تم توليد هذا النص من مولد النص العربى  حيث يمكنك أن 
تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى
 زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد 
أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات 
كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد 
النص العربى مفيد لمصممي المواقع على وجه الخصوص، 
حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة 
حقيقية لتصميم الموقع.
""",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 0.5,
                      endIndent: 10,
                      indent: 10,
                    ),
                    15.height,
                    Text(
                      "مميزات العقار",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400),
                    ),
                    10.height,
                    IconTitleBuilder(
                      title: "المساحة",
                      horizontal: 0,
                      titleColor: Colors.grey,
                      fontSize: 12.sp,
                      bottom: 10.h,
                      trailing: Text(
                        "180  m",
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 0.5,
                    ),
                    10.height,
                    IconTitleBuilder(
                      title: "غرف نوم ماستر",
                      horizontal: 0,
                      titleColor: Colors.grey,
                      fontSize: 12.sp,
                      bottom: 10.h,
                      trailing: Text(
                        "3",
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 0.5,
                    ),
                    10.height,
                    IconTitleBuilder(
                      title: "غرف نوم",
                      horizontal: 0,
                      titleColor: Colors.grey,
                      fontSize: 12.sp,
                      bottom: 10.h,
                      trailing: Text(
                        "2",
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 0.5,
                    ),
                    10.height,
                    IconTitleBuilder(
                      title: "الصالات",
                      horizontal: 0,
                      titleColor: Colors.grey,
                      fontSize: 12.sp,
                      bottom: 10.h,
                      trailing: Text(
                        "1",
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 0.5,
                    ),
                    10.height,
                    IconTitleBuilder(
                      title: "دورات المياه",
                      horizontal: 0,
                      titleColor: Colors.grey,
                      fontSize: 12.sp,
                      bottom: 10.h,
                      trailing: Text(
                        "3",
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ),
                    48.height,
                    Row(
                      children: [
                        Expanded(
                          child: MyButton(
                            onTap: () {
                              Get.toNamed(Routes.projectStagesScreen);
                            },
                            height: 50,
                            fontSize: 12,
                            text: "مراحل المشروع",
                            iconHeight: 18,
                          ),
                        ),
                        10.width,
                        const Expanded(
                          child: MyButton(
                            fillColor: Color(0xffF8AE7D),
                            height: 50,
                            text: "ابلاغ عن مشكللة",
                            iconHeight: 20,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
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
