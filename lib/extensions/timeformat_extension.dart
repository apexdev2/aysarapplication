import 'package:intl/intl.dart';

extension TimeFormatter on String {
  /// Converts an ISO datetime string (e.g., "2025-02-20T09:12:43.7498998")
  /// into a readable time format like "09:12 AM".
  String toFormattedTime() {
    try {
      DateTime dateTime = DateTime.parse(this);
      return DateFormat.jm().format(dateTime); // 09:12 AM
    } catch (e) {
      return "Invalid Date"; // Handle parsing errors
    }
  }
}

extension DateFormatter on String {
  /// Converts `DateTime` string like "2025-02-27 00:00:00.000" to "27 Feb 2025"
  String toFormattedDate() {
    try {
      DateTime dateTime = DateTime.parse(this);
      return DateFormat('dd/MM/yyyy').format(dateTime); // Example: 27 Feb 2025
    } catch (e) {
      return "Invalid Date";
    }
  }
}
