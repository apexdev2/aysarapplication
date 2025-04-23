import 'package:aysar_app/extensions/sized_box_extension.dart';
import 'package:aysar_app/helpers/image_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTitleBuilder extends StatelessWidget with ImageHelper {
  final String? icon;
  // ignore: non_constant_identifier_names
  final Color? iconcolor;
  final String title;
  final Widget? trailing;
  final double bottom;
  final double horizontal;
  final double fontSize;
  final FontWeight fontWeight;
  final double iconSize;
  final String? hint;
  final Color? hintColor;
  final bool arrow;
  final Color? titleColor;
  final TextStyle? titlestyle;
  const IconTitleBuilder({
    this.icon,
    required this.title,
    this.iconcolor,
    this.trailing,
    this.bottom = 0,
    this.horizontal = 20,
    this.fontSize = 14,
    this.fontWeight = FontWeight.bold,
    this.iconSize = 18,
    this.hint,
    this.hintColor,
    this.arrow = false,
    super.key,
    this.titleColor,
    this.titlestyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: bottom.h,
        left: horizontal.w,
        right: horizontal.w,
      ),
      child: Row(
        children: [
          icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    appSvgImage(icon!, width: iconSize.w, color: iconcolor),
                    8.width,
                  ],
                )
              : empty,
          Text(
            title,
            style: titlestyle ??
                TextStyle(
                    fontSize: fontSize.sp,
                    fontWeight: fontWeight,
                    color: titleColor),
          ),
          hint != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    5.width,
                    Text(
                      hint!,
                      style: TextStyle(
                        color: hintColor ??
                            Theme.of(context).hintColor.withOpacity(.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              : empty,
          const Spacer(),
          trailing ?? _arrow ?? empty,
        ],
      ),
    );
  }

  Widget? get _arrow => arrow
      ? Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black45,
          size: 20.h,
        )
      : null;
}
