import 'package:shipcret/providers/entitys/feed_summary.entity.dart';
import 'package:shipcret/providers/feed/feed_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipcret/providers/feed/feed_request_dto.dart';

final feedSummaryProvider =
    FutureProvider.autoDispose.family<FFeedSummaryEntity, FRequestFeedDto>((ref, requestDto) async {
  final optional = await ref.read(feedRepository).feedSummary(requestDto);
  if (!optional.hasValue) {
    return const FFeedSummaryEntity();
  }

  return FFeedSummaryEntity.fromJson(optional.value.toJson());
});
