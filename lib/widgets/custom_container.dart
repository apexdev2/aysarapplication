import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? borderRadius;
  final BoxBorder? border;
  final BoxShadow? boxShadow;
  final Gradient? gradient;
  final AlignmentGeometry? alignment;
  final BoxShape shape;

  const CustomContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color = Colors.white,
    this.borderRadius = 10,
    this.border,
    this.boxShadow,
    this.gradient,
    this.alignment,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius!),
        border: border,
        boxShadow: boxShadow != null ? [boxShadow!] : null,
        gradient: gradient,
        shape: shape,
      ),
      child: child,
    );
  }
}
