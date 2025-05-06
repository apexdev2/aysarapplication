import 'package:aysar_app/extensions/sized_box_extension.dart';
import 'package:aysar_app/helpers/assets_helper.dart';
import 'package:aysar_app/helpers/image_helper.dart';
import 'package:aysar_app/utils/temp.dart';
import 'package:aysar_app/widgets/icon_title_builder.dart';
import 'package:aysar_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompanyDetailsScreen extends StatelessWidget with ImageHelper {
  const CompanyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          appLocale.details,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: EdgeInsets.all(16.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Company Logo
              Center(
                child: Container(
                  width: 93.w,
                  height: 93.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: appCachedImage(
                      tempImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              30.height,
              // Company Name
              Center(
                child: Text(
                  "شركة ديار العقارية",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              50.height,
              Text(
                "نبذة عن الشركة",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              10.height,
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
                  color: Colors.grey,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              10.height,
              Text(
                "بيانات التواصل",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              10.height,
              IconTitleBuilder(
                horizontal: 0,
                // iconcolor: Colors.amber,
                icon: AssetsHelper.yellowphone,
                iconSize: 25,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                title: appLocale.mobile,
                trailing: const Text("966123456789"),
              ),
              8.height,
              IconTitleBuilder(
                horizontal: 0,
                // iconcolor: Colors.amber,
                icon: AssetsHelper.redemail,
                iconSize: 25,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                title: appLocale.email,
                trailing: const Text("966123456789"),
              ),
              48.height,
              Row(
                children: [
                  Expanded(
                    child: MyButton(
                      height: 50,
                      fontSize: 12,
                      text: appLocale.contactViaWhatsApp,
                      icon: AssetsHelper.whatsapp,
                      iconColor: Colors.white,
                      iconHeight: 18,
                      iconThenText: true,
                    ),
                  ),
                  10.width,
                  const Expanded(
                    child: MyButton(
                      height: 50,
                      text: "contactViaemail",
                      // text: appLocale.contactViaemail,
                      icon: AssetsHelper.redemail,
                      iconColor: Colors.white,
                      iconHeight: 20,
                      fontSize: 12,
                      iconThenText: true,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
