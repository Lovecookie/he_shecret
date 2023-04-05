import 'package:fixnum/fixnum.dart';
import 'package:shipcret/providers/response_data.dart';

class FFeedResponseDto extends FResponseDto {
  final Int64 feeduuid;
  final String title;
  final int viewCount;
  final int likeCount;
  final Int64 useruuid;

  const FFeedResponseDto({
    required this.feeduuid,
    required this.title,
    required this.viewCount,
    required this.likeCount,
    required this.useruuid,
  });

  @override
  List<Object?> get props => [
        feeduuid,
        title,
        viewCount,
        likeCount,
        useruuid,
      ];

  @override
  FResponseJson toJson() {
    return {
      'feeduuid': feeduuid,
      'title': title,
      'viewCount': viewCount,
      'likeCount': likeCount,
      'useruuid': useruuid,
    };
  }

  static FFeedResponseDto fromJson(Map<String, dynamic> json) {
    return FFeedResponseDto(
      feeduuid: Int64.parseInt(json['feeduuid']),
      title: json['title'],
      viewCount: json['viewCount'],
      likeCount: json['likeCount'],
      useruuid: Int64.parseInt(json['useruuid']),
    );
  }
}

class FFeedDetailResponseDto extends FResponseDto {
  final Int64 feeduuid;
  final String title;
  final String content;
  final String contentUrl;
  final int viewCount;
  final int likeCount;
  final Int64 useruuid;

  const FFeedDetailResponseDto({
    required this.feeduuid,
    required this.title,
    required this.content,
    required this.contentUrl,
    required this.viewCount,
    required this.likeCount,
    required this.useruuid,
  });

  @override
  List<Object?> get props => [
        feeduuid,
        title,
        content,
        contentUrl,
        viewCount,
        likeCount,
        useruuid,
      ];

  @override
  FResponseJson toJson() {
    return {
      'feeduuid': feeduuid,
      'title': title,
      'content': content,
      'contentUrl': contentUrl,
      'viewCount': viewCount,
      'likeCount': likeCount,
      'useruuid': useruuid,
    };
  }

  static FFeedDetailResponseDto fromJson(Map<String, dynamic> json) {
    return FFeedDetailResponseDto(
      feeduuid: Int64.parseInt(json['feeduuid']),
      title: json['title'],
      content: json['content'],
      contentUrl: json['contentUrl'],
      viewCount: json['viewCount'],
      likeCount: json['likeCount'],
      useruuid: Int64.parseInt(json['useruuid']),
    );
  }
}
