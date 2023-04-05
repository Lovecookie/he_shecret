import 'package:equatable/equatable.dart';
import 'package:fixnum/fixnum.dart';
import 'package:shipcret/providers/feed/feed.responseDto.dart';

class FFeedEntity extends Equatable {
  final Int64 feeduuid;
  final String title;
  final String content;
  final String contentUrl;
  final int viewCount;
  final int likeCount;
  final Int64 useruuid;

  const FFeedEntity({
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

  factory FFeedEntity.fromDto(FFeedResponseDto responseDto) {
    return FFeedEntity(
      feeduuid: responseDto.feeduuid,
      title: responseDto.title,
      content: '',
      contentUrl: '',
      viewCount: responseDto.viewCount,
      likeCount: responseDto.likeCount,
      useruuid: responseDto.useruuid,
    );
  }

  factory FFeedEntity.fromDetailDto(FFeedDetailResponseDto responseDto) {
    return FFeedEntity(
      feeduuid: responseDto.feeduuid,
      title: responseDto.title,
      content: responseDto.content,
      contentUrl: responseDto.contentUrl,
      viewCount: responseDto.viewCount,
      likeCount: responseDto.likeCount,
      useruuid: responseDto.useruuid,
    );
  }
}
