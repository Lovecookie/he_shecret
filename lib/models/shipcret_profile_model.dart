import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:shipcret/common/common_assets.dart';

class FSecretProfileModel extends Equatable {
  final String userId;
  final String nickName;
  final String profileImageUrl;
  final String location;
  final int secretCount;
  final int uncoveredSecretCount;

  const FSecretProfileModel({
    required this.userId,
    required this.nickName,
    required this.profileImageUrl,
    required this.location,
    required this.secretCount,
    required this.uncoveredSecretCount,
  });

  @override
  List<Object> get props => [userId, nickName, profileImageUrl, location, secretCount, uncoveredSecretCount];

  factory FSecretProfileModel.fromJson(Map<String, dynamic> json) {
    return FSecretProfileModel(
      userId: json['userId'],
      nickName: json['nickName'],
      profileImageUrl: json['profileImageUrl'],
      location: json['location'],
      secretCount: json['secretCount'],
      uncoveredSecretCount: json['uncoveredSecretCount'],
      // userTags: List<String>.from(json['user_tags'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'nickName': nickName,
      'profileImageUrl': profileImageUrl,
      'location': location,
      'secretCount': secretCount,
      'uncoveredSecretCount': uncoveredSecretCount,
      // 'user_tags': List<dynamic>.from(userTags.map((x) => x)),
    };
  }

  static List<Map<String, dynamic>> generateRandomData() {
    Random random = Random();
    List<Map<String, dynamic>> data = [];

    for (int i = 0; i < 20; i++) {
      // List<String> userTags = [];
      // for (int j = 0; j < 3; j++) {
      //   userTags.add("user${random.nextInt(1000)}");
      // }

      int secret = random.nextInt(1000);
      int uncovered = random.nextInt(10);

      data.add({
        'userId': random.nextInt(100).toString(),
        'nickName': 'andrea whitner',
        'profileImageUrl': FCommonAssets.randomImageAssets(),
        'location': 'Republic of korea',
        'secretCount': secret,
        'uncoveredSecretCount': uncovered,
      });
    }

    return data;
  }
}
