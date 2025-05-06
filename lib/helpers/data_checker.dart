import 'package:aysar_app/utils/enms.dart';
import 'package:aysar_app/utils/utils.dart';

mixin DataCheckerHelper {
  bool checkText({
    required String text,
    bool isEmpty = true,
    bool email = false,
    bool mobile = false,
    required String errorMessage,
    double? b,
  }) {
    if (text.isEmpty) {
      error(errorMessage, b);
      return false;
    } else if (email && !_checkEmail(text)) {
      error("أدخل ايميل صحيح", b);
      return false;
    } else if (mobile && (text.length <= 7)) {
      error("أدخل رقم هاتف صحيح", b);
      return false;
    }

    return true;
  }

  bool checkTextsMatch({
    required String text1,
    required String text2,
    required String errorMessage,
    double? b,
  }) {
    if (text1 == text2) {
      return true;
    } else {
      error(errorMessage, b);
      return false;
    }
  }

  bool checkObject({
    required dynamic object,
    required String message,
    double? b,
  }) {
    if (object == null) {
      error(message, b);
      return false;
    }

    return true;
  }

  bool checkBool({
    required bool item,
    required String message,
    double? b,
  }) {
    if (!item) {
      error(message, b);
      return false;
    }

    return true;
  }

  bool checkList({
    required List<dynamic> list,
    required String message,
    double? b,
  }) {
    if (list.isEmpty) {
      error(message, b);
      return false;
    }

    return true;
  }

  bool _checkEmail(String email) {
    /// Check Email Format
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool otpChecker({
    required String text,
    int length = 4,
    double? b,
  }) {
    if (text.length != length) {
      error("أدخل كود التحقق", b);
      return false;
    }

    return true;
  }

  void error(String errorMessage, double? bottom) {
    Utils.getSnakBar(
      message: errorMessage,
      type: TosterTypes.warning,
      // bottom: bottom,
    );
  }
}
