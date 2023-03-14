import 'package:equatable/equatable.dart';

class FRecommendSearchModel extends Equatable {
  final String location;
  final String searchTag;
  final int searchCount;

  const FRecommendSearchModel({
    required this.location,
    required this.searchTag,
    required this.searchCount,
  });

  @override
  List<Object> get props => [location, searchTag, searchCount];

  factory FRecommendSearchModel.fromJson(Map<String, dynamic> json) {
    return FRecommendSearchModel(
      location: json['location'],
      searchTag: json['searchTag'],
      searchCount: json['searchCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'searchTag': searchTag,
      'searchCount': searchCount,
    };
  }

  static List<Map<String, dynamic>> generateRandomData() {
    List<Map<String, dynamic>> data = [];

    for (int i = 0; i < 20; i++) {
      data.add({
        'location': "하남시 $i",
        'searchTag': "searchTag $i",
        'searchCount': i,
      });
    }

    return data;
  }
}
