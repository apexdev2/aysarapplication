// import 'package:rieaya_app/api/api_paths.dart';
// import 'package:rieaya_app/api/api_service.dart';
// import 'package:rieaya_app/api/network/remote/api_response_handler.dart';
// import 'package:rieaya_app/models/login_model.dart';
// import 'package:rieaya_app/models/third_party_testmodel.dart';

// class AuthRepo {
//   Future<ApiResponseHandler<LoginModel>> loginUser(
//       {required Map<String, dynamic> loginData}) async {
//     return await ApiService.sendRequest<LoginModel>(
//       url: ApiEndPoints.checkuseraccess,
//       fromJson: (json) => LoginModel.fromJson(json),
//       body: loginData,
//       method: RequestMethod.post, // Use POST method
//     );
//   }

//   Future<ApiResponseHandler<AThirdPartyTestModel>> loginAThirdPartyTest({
//     required String userId,
//   }) async {
//     final response = await ApiService.sendRawRequest<AThirdPartyTestModel>(
//       url: ApiEndPoints.loginAThirdPartyTest,
//       method: RequestMethod.post,
//       body: {
//         "trackId": "",
//         "userId": userId,
//         "tenacity": "",
//         "operation": "",
//         "location": "23.5880, 58.3829"
//       },
//       fromJson: (json) => AThirdPartyTestModel.fromJson(json),
//     );
//     return response;
//   }

//   Future<ApiResponseHandler<LoginModel>> registerCompany(
//       Map<String, dynamic> registerData, String otpCode) async {
//     return await ApiService.sendRequest<LoginModel>(
//       url: "${ApiEndPoints.register}?otpCode=$otpCode",
//       fromJson: (json) => LoginModel.fromJson(json), // No data model needed
//       body: registerData,
//       method: RequestMethod.post, // Ensure it's a POST request
//     );
//   }

//   Future<ApiResponseHandler<void>> sentOtp(
//       {required String phoneNumber}) async {
//     return await ApiService.sendRequest<void>(
//       url: ApiEndPoints.sendOtp,
//       fromJson: (json) => json.toString(), // No data model needed
//       body: {"phoneNumber": phoneNumber},
//       method: RequestMethod.post, // Use POST method
//     );
//   }

//   Future<ApiResponseHandler<void>> changePhoneNumber(
//       {required String phoneNumber, required String code}) async {
//     return await ApiService.sendRequest<void>(
//       url: ApiEndPoints.changephonenumber,
//       fromJson: (json) => json.toString(), // No data model needed
//       body: {"phoneNumber": phoneNumber, "otpCode": code},
//       method: RequestMethod.post, // Use POST method
//     );
//   }

//   Future<ApiResponseHandler<void>> verifySentOtp(
//       {required String phoneNumber, required String otpCode}) async {
//     return await ApiService.sendRequest<void>(
//       url: ApiEndPoints.verifyUserOTP,
//       fromJson: (json) => json.toString(),
//       body: {
//         "phoneNumber": phoneNumber,
//         "otpCode": otpCode,
//       },
//       method: RequestMethod.post, // Use POST method
//     );
//   }

//   Future<ApiResponseHandler<void>> forgetPasswordChange(
//       {required String confirmPassword,
//       required String otpCode,
//       required String otpToken,
//       required String newPassword}) async {
//     return await ApiService.sendRequest<void>(
//       url: ApiEndPoints.forgetPassword,
//       fromJson: (json) => json.toString(),
//       body: {
//         "newPassword": newPassword,
//         "confirmPassword": confirmPassword,
//         "otpCode": otpCode,
//         "otpToken": otpToken
//       },
//       method: RequestMethod.post, // Use POST method
//     );
//   }
// }
