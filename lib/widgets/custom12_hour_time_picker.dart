import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;

class Custom12HourTimePicker extends picker.CommonPickerModel {
  bool isAM = true;

  Custom12HourTimePicker({DateTime? currentTime, super.locale}) {
    this.currentTime = currentTime ?? DateTime.now();
    setLeftIndex(
        this.currentTime.hour % 12); // Initialize hour in 12-hour format
    setMiddleIndex(this.currentTime.minute ~/ 30); // Use 30-minute intervals
    setRightIndex(this.currentTime.hour < 12 ? 0 : 1); // Initialize AM/PM index
    isAM = this.currentTime.hour < 12;
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= 0 && index < 12) {
      int hour =
          (index == 0 ? 12 : index); // Convert 0 to 12 for 12-hour format
      return hour.toString().padLeft(2, '0');
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
    // Only allow two options: AM (index 0) and PM (index 1)
    if (index == 0) {
      return "AM";
    } else if (index == 1) {
      return "PM";
    }
    return null;
  }

  @override
  List<int> layoutProportions() {
    return [1, 1, 1]; // Show hour, minute, and AM/PM picker
  }

  int maxRightIndex() =>
      1; // Limit the right picker to only 0 and 1 for AM and PM

  @override
  DateTime finalTime() {
    int hour = currentLeftIndex() == 0
        ? 12
        : currentLeftIndex(); // Convert 12-hour to 24-hour format
    if (!isAM) hour += 12;
    return DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      hour % 24,
      currentMiddleIndex() * 30,
    );
  }

  @override
  void setRightIndex(int index) {
    isAM = index == 0;
    super.setRightIndex(
        index); // Call super to ensure `_currentRightIndex` is set
  }
}
