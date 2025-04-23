import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    super.key,
    required this.mainbody,
  });
  final Widget mainbody;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.only(top: 30.h, start: 16.w, end: 16.w),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: mainbody);
  }
}
