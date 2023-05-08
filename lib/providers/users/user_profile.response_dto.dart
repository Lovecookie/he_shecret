
import 'package:shipcret/providers/response_data.dart';

import 'package:fixnum/fixnum.dart';

class FUserProfileResponseDto extends FResponseDto {
  final String useruuid;
  final String userName;
  final String userState;
  final Int64 followerCount;
  final Int64 feedCount;
  final Int64 secretCount;
  final Int64 showingSecretCount;

  const FUserProfileResponseDto({
    required this.useruuid,
    required this.userName,
    required this.userState,
    required this.followerCount,
    required this.feedCount,
    required this.secretCount,
    required this.showingSecretCount,
  });

  @override
  List<Object?> get props => [
        useruuid,
        userName,
        userState,
        followerCount,
        feedCount,
        secretCount,
        showingSecretCount,
      ];

  @override
  FResponseJson toJson() {
    return {
      'useruuid': useruuid,
      'userName': userName,
      'userState': userState,
      'followerCount': followerCount.toString(),
      'feedCount': feedCount.toString(),
      'secretCount': secretCount.toString(),
      'showingSecretCount': showingSecretCount.toString(),
    };
  }

  static FResponseDto fromJson(FResponseJson json) {
    return FUserProfileResponseDto(
      useruuid: json['useruuid'],
      userName: json['userName'],
      userState: json['userState'],
      followerCount: Int64.parseInt(json['followerCount']),
      feedCount: Int64.parseInt(json['feedCount']),
      secretCount: Int64.parseInt(json['secretCount']),
      showingSecretCount: Int64.parseInt(json['showingSecretCount']),
    );
  }
}
