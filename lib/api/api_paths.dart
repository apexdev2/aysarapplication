class ApiEndPoints {
  static const String _baseUrl = productionUrl;
  static const String _apiBaseUrl = '${_baseUrl}api/staff/';
  static const String _apiVersionBaseUrl = '${_apiBaseUrl}v1/';
  static const String apiFullUrl = _apiVersionBaseUrl;
  static const String stageUrl = "https://stage.actionpointoman.com/";
  static const String productionUrl = "https://panel.actionpoint.om/";
  static String countries = '${apiFullUrl}shared/countries';
  static String identityType = '${apiFullUrl}shared/identity-type';
  static String registerClient = '${apiFullUrl}appointments/register-client';

  /// Auth
  static const String login = '${apiFullUrl}login';
  static const String verifylogin = '${apiFullUrl}verify-login';
  static const String forgotPassword = '${apiFullUrl}forgotPassword';
  static const String verifyOtp = '${apiFullUrl}verifyOtp';
  static const String resetPassword = '${apiFullUrl}resetPassword';
  static const String logout = '${apiFullUrl}logout';
  static const String myProfile = '${apiFullUrl}profile/me';
  static const String deleteAccount = '${apiFullUrl}settings/delete-account';
  static const String changepassword = '${apiFullUrl}settings/change-password';
  static const String verifychangepassword =
      '${apiFullUrl}profile/verify-change-password-otp';
  static const String notifications = '${apiFullUrl}notifications';
  static const String changedefaultlanguage =
      '${apiFullUrl}settings/change-default-language';

// Reservations
  static const String reservations = '${apiFullUrl}reservations';

  static const String tickets = '${apiFullUrl}tickets';

  static const String reservationStatus =
      '${apiFullUrl}shared/reservation-status';
// appointments
  static const String checkmobileclientnts =
      '${apiFullUrl}appointments/check-mobile-client';
  static const String services = '${apiFullUrl}shared/services';
  static const String storeAppointments = '${apiFullUrl}appointments';
  static const String confirmReservations =
      '${apiFullUrl}reservations/confirm-reservations';

  static const String activateNotification =
      '${apiFullUrl}settings/change-activate-notification';
}
