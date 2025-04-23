import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

mixin SnackBarHelper {
  showSnackBar({
    required String message,
    bool error = false,
    int duration = 2,
    double? bottom,
  }) {
    GetSnackBar(
      message: message,

      messageText: Text(message),
      titleText: Text(message),
      // '', // No title for the snackbar
      // message.replaceAll('Exception: ', ''), // Clean up the message
      snackPosition: SnackPosition.BOTTOM, // Position at the bottom
      backgroundColor:
          error ? const Color(0xffff4d4f) : const Color(0xff279357),

      icon: Icon(
        error ? Icons.error_outline_outlined : Icons.check_circle_outline,
        size: 18.h,
        color: Colors.white,
      ),
      duration: Duration(seconds: duration), // Duration for the snackbar
      margin: EdgeInsets.only(
        right: 20.w,
        left: 20.w,
        bottom: (bottom ?? 40).h, // Adjust bottom padding
      ),
      borderRadius: 10.r, // Rounded corners
      snackStyle: SnackStyle.FLOATING, // Floating snackbar
      dismissDirection: DismissDirection.horizontal, // Dismissable horizontally
      isDismissible: true, // Allow dismissal
    );
  }
}
