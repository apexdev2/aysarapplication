
import 'package:aysar_app/helpers/styles_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAlertButton extends StatelessWidget with StylesHelper {
  final String text;
  final bool filled;
  final Function() action;
  final double height;
  final bool loading;

  const MyAlertButton({
    required this.text,
    required this.filled,
    required this.action,
    this.height = 45,
    this.loading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: action,
        child: Container(
          height: height.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: filled
                ? Theme.of(context).primaryColor
                : const Color(0xffF7F7F7),
            borderRadius: BorderRadius.circular(50.r),

          ),
          child: !loading
              ? Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color:
                        filled ? Colors.white : null,
                    fontWeight: FontWeight.w500,
                    height: 1.h,
                  ),
                )
              : CircularProgressIndicator(
                  color:
                      filled ? Colors.white : Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
