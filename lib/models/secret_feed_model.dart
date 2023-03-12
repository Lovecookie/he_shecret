import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:shipcret/common/common_assets.dart';

class FSecretFeedModel extends Equatable {
  final String feedId;
  final String profileImageUrl;
  final String secretTitle;
  final String secretContent;
  final DateTime startDateTime;
  final DateTime expiredDateTime;
  final List<String> userTags;

  const FSecretFeedModel({
    required this.feedId,
    required this.secretTitle,
    required this.profileImageUrl,
    required this.secretContent,
    required this.startDateTime,
    required this.expiredDateTime,
    required this.userTags,
  });

  @override
  List<Object> get props => [feedId, secretTitle, profileImageUrl, userTags];

  factory FSecretFeedModel.fromJson(Map<String, dynamic> json) {
    return FSecretFeedModel(
      feedId: json['feed_id'],
      profileImageUrl: json['profile_image_url'],
      secretTitle: json['secret_title'],
      secretContent: json['secret_content'],
      startDateTime: json['start_datetime'],
      expiredDateTime: json['expired_datetime'],
      userTags: List<String>.from(json['user_tags'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feed_id': feedId,
      'profile_image_url': profileImageUrl,
      'secret_title': secretTitle,
      'secret_content': secretContent,
      'start_datetime': startDateTime,
      'expired_datetime': expiredDateTime,
      'user_tags': List<dynamic>.from(userTags.map((x) => x)),
    };
  }

  static List<Map<String, dynamic>> generateRandomData() {
    Random random = Random();
    List<Map<String, dynamic>> data = [];

    for (int i = 0; i < 30; i++) {
      List<String> userTags = [];
      for (int j = 0; j < 3; j++) {
        userTags.add("user${random.nextInt(1000)}");
      }

      final now = DateTime.now();
      final expired = now.add(Duration(minutes: random.nextInt(10) + 2));

      data.add({
        'feed_id': random.nextInt(100).toString(),
        'secret_title': 'My Secret ${i + 1}',
        'secret_content': 'Secret number ${i + 1} is a secret',
        'profile_image_url': FCommonAssets.randomImageAssets(),
        'start_datetime': now,
        'expired_datetime': expired,
        'user_tags': userTags,
      });
    }

    return data;
  }
}
