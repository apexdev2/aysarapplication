import 'package:aysar_app/extensions/sized_box_extension.dart';
import 'package:aysar_app/helpers/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoWidget extends StatelessWidget with ImageHelper {
  const InfoWidget(
      {super.key, this.image, this.mobile, this.email, this.onTap, this.name});
  final String? image;
  final String? name;

  final String? mobile;
  final String? email;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: 90.h,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: const Color(0xffDDECFF)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 56.h,
              width: 56.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: appCachedImage(image, fit: BoxFit.cover),
              ),
            ),
            10.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name ?? "",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12.sp,
                  ),
                ),
                5.height,
                Row(
                  children: [
                    appSvgImage("assets/icons/mobile_icon.svg",
                        color: Colors.grey, height: 17.h, width: 17.w),
                    5.width,
                    Text(
                      textDirection: TextDirection.ltr,
                      mobile ?? '',
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                5.height,
                Row(
                  children: [
                    appSvgImage("assets/icons/email_icon.svg",
                        color: Colors.grey, height: 15.h, width: 15.w),
                    5.width,
                    Text(
                      email ?? '',
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
