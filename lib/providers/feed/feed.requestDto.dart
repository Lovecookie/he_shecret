import 'package:fixnum/fixnum.dart';
import 'package:shipcret/providers/entitys/feed.entity.dart';
import 'package:shipcret/providers/response_data.dart';

class FCreateFeedRequestDto extends FRequestDtoBase {
  final String title;
  final String content;
  final String contentUrl;

  const FCreateFeedRequestDto({
    required this.title,
    required this.content,
    this.contentUrl = '',
  });

  @override
  List<Object?> get props => [title, content, contentUrl];

  @override
  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "contentUrl": contentUrl,
      };

  factory FCreateFeedRequestDto.fromJson(Map<String, dynamic> json) => FCreateFeedRequestDto(
        title: json["title"],
        content: json["content"],
        contentUrl: json["contentUrl"],
      );

  factory FCreateFeedRequestDto.fromEntity(FFeedEntity entity) {
    return FCreateFeedRequestDto(
      title: entity.title,
      content: entity.content,
      contentUrl: '',
    );
  }
}

class FSearchFeedDto extends FRequestDtoBase {
  final Int64 nextFeeduuid;

  const FSearchFeedDto({
    required this.nextFeeduuid,
  });

  @override
  List<Object?> get props => [nextFeeduuid];

  @override
  Map<String, dynamic> toJson() {
    return {
      'nextFeedUuid': nextFeeduuid.toString(),
    };
  }

  @override
  factory FSearchFeedDto.fromEntity(FFeedEntity entity) {
    return FSearchFeedDto(
      nextFeeduuid: entity.feeduuid,
    );
  }
}
