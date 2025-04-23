
// import 'package:aysar_app/cache/cache_controller.dart';
// import 'package:aysar_app/utils/enms.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';

// enum SupportState {
//   unknown,
//   supported,
//   unsupported,
// }

// mixin BiometricAuthHelper<T extends StatefulWidget> on State<T> {
//   final LocalAuthentication _auth = LocalAuthentication();
//   SupportState _supportState = SupportState.unknown;
//   List<BiometricType>? _availableBiometrics;
//   bool _isUserActivateBiometric = false;

//   SupportState get supportState => _supportState;
//   List<BiometricType>? get availableBiometrics => _availableBiometrics;
//   bool get isUserActivateBiometric => _isUserActivateBiometric;

//   @override
//   void initState() {
//     super.initState();
//     _checkDeviceSupport();
//     _checkBiometricStatus();
//   }

//   Future<void> _checkDeviceSupport() async {
//     bool isSupported;
//     try {
//       isSupported = await _auth.isDeviceSupported();
//     } on PlatformException catch (e) {
//       print('Error checking device support: $e');
//       isSupported = false;
//     }

//     if (!mounted) return;

//     setState(
//       () {
//         _supportState =
//             isSupported ? SupportState.supported : SupportState.unsupported;
//       },
//     );

//     if (isSupported) {
//       _getAvailableBiometrics();
//     }
//   }

//   Future<void> _checkBiometricStatus() async {
//     // هنا يمكنك جلب حالة تفعيل البيومتريك من التخزين المؤقت أو أي مصدر آخر
//     // على سبيل المثال:
//     _isUserActivateBiometric =
//         CacheController().getter(key: CacheKeys.activeBiometric) ?? false;
//     // إذا كنت تريد تعيين قيمة افتراضية:
//     // _isUserActivateBiometric = false;
//   }

//   Future<void> _getAvailableBiometrics() async {
//     try {
//       _availableBiometrics = await _auth.getAvailableBiometrics();
//       print("Supported biometrics: $_availableBiometrics");
//     } on PlatformException catch (e) {
//       print('Error getting available biometrics: $e');
//       _availableBiometrics = [];
//     }

//     if (!mounted) return;

//     setState(() {});
//   }

//   Future<bool> authenticateWithBiometrics() async {
//     try {
//       final authenticated = await _auth.authenticate(
//         localizedReason: "authenticatetoaccesstheapp",
//         options: const AuthenticationOptions(
//           stickyAuth: true,
//           biometricOnly: true,
//         ),
//       );
//       return authenticated;
//     } on PlatformException catch (e) {
//       print('Error during authentication: $e');
//       return false;
//     }
//   }

//   /// وظيفة لإظهار رسالة تنبيه للمستخدم إذا لم يكن البيومتري مدعومًا
//   void showBiometricUnsupportedMessage() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (_supportState == SupportState.unsupported &&
//           _isUserActivateBiometric) {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Biometric Unavailable'),
//             content: const Text(
//                 'Your device does not support biometric authentication.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     });
//   }
// }
