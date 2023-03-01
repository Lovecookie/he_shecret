import 'package:he_shecret/common/common_enum.dart';

import 'package:equatable/equatable.dart';
import 'package:fixnum/fixnum.dart';

// ignore: must_be_immutable
class FUserFeedModel extends Equatable {
  final String key;
  final Int64 userId;
  final String email;
  final String displayName;
  final String userTag;
  final String profileImage;
  final EFeedContentType feedContentType;
  final String contentLink;
  final String secretMessage;

  const FUserFeedModel({
    required this.key,
    required this.userId,
    required this.email,
    required this.displayName,
    required this.userTag,
    required this.profileImage,
    required this.feedContentType,
    required this.contentLink,
    required this.secretMessage,
  });

  factory FUserFeedModel.fromJson(Map<String, dynamic> json) {
    return FUserFeedModel(
      key: json['key'],
      userId: Int64(json['userId']),
      email: json['email'],
      displayName: json['displayName'],
      userTag: json['userTag'],
      profileImage: json['profileImage'] ?? '',
      feedContentType: json['feedContentType'] ?? EFeedContentType.none,
      contentLink: json['contentLink'] ?? '',
      secretMessage: json['secretMessage'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        key,
        userId,
        email,
        displayName,
        userTag,
        profileImage,
        feedContentType,
        contentLink,
        secretMessage,
      ];
}
