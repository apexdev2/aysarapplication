import 'package:aysar_app/helpers/image_helper.dart';
import 'package:aysar_app/helpers/styles_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyListTile extends StatefulWidget {
  final String icon;
  final String leading;
  final bool trailingIcon;
  final Function()? onTap;
  final Color? itemColor;
  final bool requiresAuth;
  final bool assetIcon;
  final bool decoration;
  final bool divider;

  const MyListTile({
    required this.icon,
    required this.leading,
    this.trailingIcon = true,
    this.onTap,
    this.itemColor,
    this.requiresAuth = true,
    this.assetIcon = true,
    this.decoration = false,
    this.divider = true,
    super.key,
  });

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile>
    with ImageHelper, StylesHelper {
  @override
  Widget build(BuildContext context) {
    // return Consumer<AuthProvider>(
    // builder: (context, auth, child) {
    return /*widget.requiresAuth && !auth.loggedIn_
            ? _empty
            :*/
        InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 9.h),
            child: Row(
              children: [
                Container(
                  height: 32.h,
                  width: 32.h,
                  alignment: Alignment.center,
                  decoration: widget.decoration
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: appLinearGradient(context,
                              colors: secondaryGradientColors),
                        )
                      : null,
                  child: appSvgImage(
                    widget.icon,
                    color: widget.itemColor,
                    width: 26.w,
                    height: 26.h,
                    network: !widget.assetIcon,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  widget.leading,
                  style: TextStyle(color: widget.itemColor, fontSize: 12.sp),
                ),
                const Spacer(),
                widget.trailingIcon
                    ? CircleAvatar(
                        radius: 14.5.r,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Center(
                          child: CircleAvatar(
                            radius: 13.r,
                            backgroundColor: Colors.white,
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      )

                    // appSvgImage(
                    //     AssetsHelper.arrowcircleright,
                    //     width: 26.w,
                    //     height: 26.h,
                    //   )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          widget.divider ? _divider : _empty,
        ],
      ),
    );

    // },
    // );
  }

  Widget get _empty => const SizedBox.shrink();

  Widget get _divider => Divider(
        height: 0.h,
        thickness: 0.5,
        color: Theme.of(context).dividerColor,
      );
}
