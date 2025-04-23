import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;

class CustomTimePicker extends picker.CommonPickerModel {
  CustomTimePicker({DateTime? currentTime, super.locale}) {
    this.currentTime = currentTime ?? DateTime.now();
    setLeftIndex(this.currentTime.hour);
    setMiddleIndex(this.currentTime.minute ~/ 30); // Use 30-minute intervals
    setRightIndex(0); // Set default right index to avoid initialization error
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return index.toString().padLeft(2, '0');
    } else {
      return null;
    }
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 0 && index < 2) {
      return (index * 30)
          .toString()
          .padLeft(2, '0'); // 00 or 30 for 30-minute intervals
    } else {
      return null;
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    return null; // No third component needed
  }

  @override
  List<int> layoutProportions() {
    return [1, 1, 0]; // Set proportion of the unused third picker to 0
  }

  @override
  DateTime finalTime() {
    return DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      currentLeftIndex(),
      currentMiddleIndex() * 30, // Apply 30-minute intervals to minutes
    );
  }
}
