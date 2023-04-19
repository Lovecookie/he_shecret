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

class FSearchFeedRequestDto extends FRequestDtoBase {
  final Int64 nextFeeduuid;

  const FSearchFeedRequestDto({
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
  factory FSearchFeedRequestDto.fromEntity(FFeedEntity entity) {
    return FSearchFeedRequestDto(
      nextFeeduuid: entity.feeduuid,
    );
  }
}

class FMyFeedRequestDto extends FRequestDtoBase {
  final Int64 nextFeeduuid;

  const FMyFeedRequestDto({
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
  factory FMyFeedRequestDto.fromEntity(FFeedEntity entity) {
    return FMyFeedRequestDto(
      nextFeeduuid: entity.feeduuid,
    );
  }
}
