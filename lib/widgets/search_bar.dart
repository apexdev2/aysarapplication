import 'package:aysar_app/extensions/sized_box_extension.dart';
import 'package:aysar_app/helpers/assets_helper.dart';
import 'package:aysar_app/helpers/image_helper.dart';
import 'package:aysar_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MySearchBar extends StatelessWidget with ImageHelper {
  const MySearchBar(
      {super.key,
      required this.searchController,
      this.filterFunction,
      this.onSubmitted,
      this.witFilter = true,
      this.borderSide = BorderSide.none,
      required this.icon,
      this.hint});

  final TextEditingController searchController;
  final Function(String)? onSubmitted;
  final Function()? filterFunction;
  final String icon;
  final String? hint;
  final BorderSide? borderSide;
  final bool? witFilter;
  @override
  Widget build(BuildContext context) {
    // AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hint ?? "appLocale.search",
              hintStyle: TextStyle(
                color: const Color(0xffA4B5B2),
                fontSize: 10.sp,
              ),
              suffixIconConstraints: const BoxConstraints(/*minWidth: 70.w*/),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: borderSide ?? BorderSide.none,
              ),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 40.h, maxWidth: 40.w),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: appSvgImage(AssetsHelper.search),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: borderSide ?? BorderSide.none,
              ),
            ),
            onSubmitted: onSubmitted ?? (value) {},
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
        10.width,
        witFilter!
            ? GestureDetector(
                onTap: filterFunction ?? () {},
                child: CustomContainer(
                  padding: const EdgeInsets.all(15),
                  borderRadius: 10,
                  height: 45.h,
                  width: 45.w,
                  child: appSvgImage(icon),
                ),
              )
            : empty
      ],
    );
  }
}
