import 'package:dotted_border/dotted_border.dart';
import 'package:aysar_app/extensions/sized_box_extension.dart';
import 'package:aysar_app/helpers/assets_helper.dart';
import 'package:aysar_app/helpers/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef CounterCallBack = Function(String _);

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? prefixIcon;
  final String? labelText;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final TextInputType inputType;
  final double topPadding;
  final double bottomPadding;
  final double horizontalPadding;
  final String? hint;
  final TextInputAction? inputAction;
  final Function(String)? onSubmitted;
  final int maxLines;
  final Function(String)? onChanged;
  final bool allowLetters;
  final Color? fillColor;
  final bool dottedBorder;
  final TextAlign textAlign;
  final bool showFocusBorder;
  final bool? obscure;
  final double? radius;
  final double endSuffixPadding;
  final CounterCallBack? counterCallBack;
  final bool hasBorder;
  final int? minLines;
  final TextDirection? hintTextDirection;
  final bool? enabled;
  final Color? textcolor;
  const MyTextField({
    this.labelText = "",
    this.controller,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.inputType = TextInputType.text,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.horizontalPadding = 0,
    this.hint,
    this.hintTextDirection,
    this.inputAction,
    this.onSubmitted,
    this.maxLines = 1,
    this.onChanged,
    this.minLines,
    this.allowLetters = true,
    this.fillColor,
    this.dottedBorder = false,
    this.textAlign = TextAlign.start,
    this.showFocusBorder = true,
    this.obscure,
    this.radius,
    this.endSuffixPadding = 20,
    this.counterCallBack,
    this.hasBorder = true,
    super.key,
    this.enabled = true,
    this.textcolor,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> with ImageHelper {
  final FocusNode _focus = FocusNode();

  bool get _noLong => widget.maxLines == 1;

  final Color _grey = const Color(0xff5D5D5D).withOpacity(0.2);

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() => setState(() => focused = _focus.hasFocus);

  bool focused = false;

  late bool _obscure = widget.obscure ?? false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.bottomPadding.h,
        top: widget.topPadding.h,
        right: widget.horizontalPadding.w,
        left: widget.horizontalPadding.w,
      ),
      child: widget.dottedBorder
          ? DottedBorder(
              dashPattern: const [6, 4],
              borderType: BorderType.RRect,
              color: focused ? Theme.of(context).primaryColor : _grey,
              strokeWidth: 1.w,
              radius: Radius.circular(_r.r),
              padding: EdgeInsets.zero,
              child: _body,
            )
          : _body,
    );
  }

  Widget get _body => Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.r,
            ),
            border: Border.all(color: const Color(0xFFD1D1D1), width: 1)),
        height: 60.h,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
              child: widget.prefixIcon != null
                  ? appSvgImage(
                      'assets/icons/${widget.prefixIcon}',
                      color: focused
                          ? Theme.of(context).primaryColor
                          : widget.prefixIconColor,
                    )
                  : null,
            ),
            appSvgImage(AssetsHelper.line),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 3.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Label Text
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(
                        widget.labelText ?? "",
                        style: const TextStyle(
                          color: Color(0xff818181),
                          fontSize: 11.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        enabled: widget.enabled ?? true,
                        scrollPadding: EdgeInsets.zero,
                        controller: widget.controller,
                        focusNode: _focus,
                        obscureText: _obscure,
                        onChanged: widget.onChanged,
                        cursorColor: Theme.of(context).primaryColor,
                        cursorHeight: _noLong ? null : 0,
                        textInputAction: widget.inputAction,
                        onSubmitted: widget.onSubmitted,
                        style:
                            TextStyle(fontSize: 14.sp, color: widget.textcolor),
                        keyboardType: widget.inputType,
                        maxLines: widget.maxLines,
                        minLines: widget.minLines ?? 1,
                        textDirection: widget.hintTextDirection,
                        inputFormatters: widget.allowLetters
                            ? []
                            : [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'(^\d*\.?\d{0,2})'))
                              ],
                        textAlign: widget.textAlign,
                        decoration: InputDecoration(
                          filled: widget.fillColor != null,
                          fillColor: widget.fillColor,
                          hintText: widget.hint,
                          hintTextDirection: widget.hintTextDirection,
                          hintStyle: TextStyle(
                            color: const Color(0xffD8D8D8),
                            fontSize: 11.sp,
                            letterSpacing: _obscure ? 10 : null,
                          ),

                          // prefixIcon: widget.prefixIcon != null
                          //     ? Padding(
                          //         padding: EdgeInsets.symmetric(horizontal: 12.w),
                          //         child: appSvgImage(
                          //             'assets/icons/${widget.prefixIcon}',
                          //             color: focused
                          //                 ? Theme.of(context).primaryColor
                          //                 : widget.prefixIconColor),
                          //       )
                          //     : null,
                          prefixIconConstraints: widget.prefixIcon != null
                              ? null
                              : const BoxConstraints(),
                          suffixIconConstraints:
                              const BoxConstraints(/*minWidth: 70.w*/),
                          suffixIcon: Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: widget.endSuffixPadding.w),
                            child: widget.obscure != null
                                ? _obscureSwitch
                                : _countChanger ?? widget.suffixIcon,
                          ),
                          suffixIconColor: WidgetStateColor.resolveWith(
                              (states) => states.contains(WidgetState.focused)
                                  ? Theme.of(context).primaryColor
                                  : const Color(0xffC9C9C9)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: _noLong ? 0 : 10.h),

                          enabledBorder: _buildOutlineInputBorder(false),
                          focusedBorder: _buildOutlineInputBorder(true),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget get _obscureSwitch {
    return InkWell(
      onTap: () => setState(() => _obscure = !_obscure),
      child: Icon(
        !_obscure ? Icons.visibility : Icons.visibility_off,
        size: 24.h,
      ),
    );
  }

  double get _r => widget.radius ?? (_noLong ? 5 : 20);

  OutlineInputBorder _buildOutlineInputBorder(bool active) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(_r.r),
      borderSide: widget.hasBorder
          ? !widget.dottedBorder
              ? BorderSide(
                  color: active && widget.showFocusBorder
                      ? Theme.of(context).primaryColor
                      : _grey,
                  width: 2.w,
                )
              : BorderSide.none
          : BorderSide.none,
    );
  }

  Widget? get _countChanger {
    if (widget.counterCallBack == null) return null;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _counterButton(true),
        3.height,
        _counterButton(false),
      ],
    );
  }

  Widget _counterButton(bool plus) {
    if (widget.controller == null) return empty;

    return InkWell(
      onTap: () {
        setState(() {
          int count = int.parse(widget.controller!.text);

          if (plus) {
            String s = (++count).toString();
            widget.counterCallBack!(s);
          } else {
            if (count > 1) {
              String m = (--count).toString();
              widget.counterCallBack!(m);
            }
          }
        });
      },
      child: Container(
        width: 18.w,
        height: 12.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: Icon(
          plus ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          size: 14.w,
          color: Colors.black,
        ),
      ),
    );
  }
}
