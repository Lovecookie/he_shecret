import 'package:fixnum/fixnum.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipcret/providers/entitys/feed.entity.dart';
import 'package:shipcret/providers/feed/feed_request_dto.dart';
import 'package:shipcret/providers/feed/feed_repository.dart';

final myFeedServiceNotifier = StateNotifierProvider<FFeedServiceState, List<FFeedEntity>>((ref) {
  return FFeedServiceState(ref, []);
});

final friendsFeedsProvider = Provider<Map<Int64, List<FFeedEntity>>>((ref) {
  return {};
});

class FFeedServiceState extends StateNotifier<List<FFeedEntity>> {
  final Ref _ref;

  FFeedServiceState(this._ref, super.state);

  get feedEntitys => state;

  Future<void> createFeed(FCreateFeedRequestDto requestDto) async {
    final optional = await _ref.read(feedRepository).createFeed(requestDto);
    if (!optional.hasValue) {
      return;
    }

    _applyFeed(optional.value);
  }

  Future<void> getMyFeed(Int64 nextuuid) async {
    final myFeedDto = FMyFeedRequestDto(nextFeeduuid: nextuuid);
    final optional = await _ref.read(feedRepository).myFeed(myFeedDto);
    if (!optional.hasValue) {
      return;
    }

    state = optional.value;
  }

  void _applyFeed(FFeedEntity feedEntity) {
    state = [...state, feedEntity];
  }
}
