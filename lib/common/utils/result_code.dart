part of util;

class FResultCode {
  static const int success = 0;
  static const int unknownError = -1;
  static const int connectionTimeOut = 10;
  static const int sendTimeOut = 11;
  static const int receiveTimeOut = 12;
  static const int badCertificate = 13;
  static const int cancel = 14;
  static const int connectionError = 14;

  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int requestTimeout = 408;
  static const int internalServerError = 500;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
  static const int gatewayTimeout = 504;

  ///* 1000 ~ 100000: Content Error Code */
  /// content error code
  ///

  ///* 1000 ~ : Auth Error Code */
  /// auth error code
  ///
  static const int invalidToken = 1000;
  static const int invalidEmail = 1001;
  static const int invalidPassword = 1002;
  static const int invalidName = 1003;
  static const int invalidPhoneNumber = 1004;
  static const int invalidAddress = 1005;

  ///* 2000 ~ : User Error Code */
  /// user error code
  ///
  static const int invalidUser = 2000;
  static const int invalidUserId = 2001;
  static const int invalidFriends = 2002;

  ///* 3000 ~ : Feed Error Code */
  /// feed error code
  ///
  static const int invalidFeed = 3000;
  static const int invalidFeedId = 3001;
  static const int invalidFeedContent = 3002;
}
