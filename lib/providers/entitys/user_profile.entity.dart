import 'package:shipcret/providers/entitys/entity_base.dart';

import 'package:fixnum/fixnum.dart';

// ignore: must_be_immutable
class FUserProfileEntity extends FEntityBase {
  final Int64 useruuid;
  final String userName;
  final String userState;
  late Int64 followerCount;
  late Int64 feedCount;
  late Int64 secretCount;
  late Int64 showingSecretCount;

  FUserProfileEntity({
    this.useruuid = Int64.ZERO,
    this.userName = '',
    this.userState = '',
    this.followerCount = Int64.ZERO,
    this.feedCount = Int64.ZERO,
    this.secretCount = Int64.ZERO,
    this.showingSecretCount = Int64.ZERO,
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
  FRequestJson toJson() {
    return {
      'useruuid': useruuid.toString(),
      'userName': userName,
      'userState': userState,
      'followerCount': followerCount.toString(),
      'feedCount': feedCount.toString(),
      'secretCount': secretCount.toString(),
      'showingSecretCount': showingSecretCount.toString(),
    };
  }

  factory FUserProfileEntity.fromJson(Map<String, dynamic> json) {
    return FUserProfileEntity(
      useruuid: Int64.parseInt(json['useruuid']),
      userName: json['userName'],
      userState: json['userState'],
      followerCount: Int64.parseInt(json['followerCount']),
      feedCount: Int64.parseInt(json['feedCount']),
      secretCount: Int64.parseInt(json['secretCount']),
      showingSecretCount: Int64.parseInt(json['showingSecretCount']),
    );
  }
}
