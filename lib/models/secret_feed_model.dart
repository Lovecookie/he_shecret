import 'dart:math';

import 'package:equatable/equatable.dart';

class FSecretFeedModel extends Equatable {
  final String feedId;
  final String secretTitle;
  final String profileImage;
  final List<String> userTags;

  const FSecretFeedModel({
    required this.feedId,
    required this.secretTitle,
    required this.profileImage,
    required this.userTags,
  });

  @override
  List<Object> get props => [feedId, secretTitle, profileImage, userTags];

  factory FSecretFeedModel.fromJson(Map<String, dynamic> json) {
    return FSecretFeedModel(
      feedId: json['feed_id'],
      secretTitle: json['secret_title'],
      profileImage: json['profile_image'],
      userTags: List<String>.from(json['user_tags'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feed_id': feedId,
      'secret_title': secretTitle,
      'profile_image': profileImage,
      'user_tags': List<dynamic>.from(userTags.map((x) => x)),
    };
  }

  static List<Map<String, dynamic>> generateRandomData() {
    Random random = Random();
    List<Map<String, dynamic>> data = [];

    for (int i = 0; i < 10; i++) {
      List<String> userTags = [];
      for (int j = 0; j < 3; j++) {
        userTags.add("user${random.nextInt(1000)}");
      }

      data.add({
        'feed_id': random.nextInt(100).toString(),
        'secret_title': 'My Secret ${i + 1}',
        'profile_image': 'https://picsum.photos/200/200',
        'user_tags': userTags,
      });
    }

    return data;
  }
}
