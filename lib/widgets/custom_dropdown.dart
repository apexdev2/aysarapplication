
import 'package:aysar_app/helpers/assets_helper.dart';
import 'package:aysar_app/helpers/image_helper.dart';
import 'package:aysar_app/widgets/my_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatefulWidget {
  final String labelText;
  final String hintText;
    final String iconData;
  final Color borderColor;
  final Color fillColor;
  final Color iconColor;
  final TextEditingController? controller;
  final bool obscureText;
  final dynamic item;
  final List<dynamic>? items;
  final SelectedDropDownCallBack callBack;
  const CustomDropDown(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.controller,
      this.obscureText = false,
      required this.iconData,
      this.borderColor = const Color(0xFFD1D1D1),
      this.fillColor = Colors.white,
      this.iconColor = const Color(0xFFB6B6B6),
      this.item,
      required this.callBack,
      this.items});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> with ImageHelper {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: widget.fillColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: widget.borderColor,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          // Icon on the right side (for Arabic layout)
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: appSvgImage(widget.iconData, color: widget.iconColor)),
          appSvgImage(AssetsHelper.line),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label Text
                  Text(
                    widget.labelText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign
                        .right, // Align text to right for Arabic layout
                  ),
                  // Input Text Field
                  Expanded(
                    child: MyDropDownMenu(
                        hasBorder: false,
                        hint: widget.hintText,
                        item: widget.item,
                        items: widget.items ?? [],
                        modalSheet: false,
                        bottomMargin: 0,
                        callBack: widget.callBack),
                  ),
                ],
              ),
            ),
          ),
       
        ],
      ),
    );
  }
}
