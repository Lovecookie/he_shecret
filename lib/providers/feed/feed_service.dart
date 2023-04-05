import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipcret/providers/entitys/feed.entity.dart';
import 'package:shipcret/providers/feed/feed.requestDto.dart';
import 'package:shipcret/providers/feed/feed_repository.dart';

final myFeedServiceNotifier = StateNotifierProvider<FFeedServiceState, List<FFeedEntity>>((ref) {
  return FFeedServiceState(ref, []);
});

final friendFeedServiceNotifier = StateNotifierProvider<FFeedServiceState, List<FFeedEntity>>((ref) {
  return FFeedServiceState(ref, []);
});

class FFeedServiceState extends StateNotifier<List<FFeedEntity>> {
  final Ref _ref;

  FFeedServiceState(this._ref, super.state);

  get feedEntitys => state;

  void createFeed(FFeedEntity feedEntity) async {
    final optional = await _ref.read(feedRepository).createFeed(FCreateFeedRequestDto.fromEntity(feedEntity));
    if (!optional.hasValue) {
      return;
    }

    _createFeed(optional.value);
  }

  void _createFeed(FFeedEntity feedEntity) {
    state = [...state, feedEntity];
  }
}
