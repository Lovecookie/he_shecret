import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipcret/common/utils/util.dart';
import 'package:shipcret/providers/dio_provider.dart';
import 'package:shipcret/providers/feed/feed.requestDto.dart';
import 'package:shipcret/providers/feed/feed.responseDto.dart';
import 'package:shipcret/providers/repository_base.dart';
import 'package:shipcret/providers/response_data.dart';

final feedRepository = Provider<FFeedRepository>((ref) {
  return FFeedRepository(ref);
});

class FFeedRepository extends FRepositoryBase {
  FFeedRepository(Ref ref) : super(ref, contentDioProvider, 'feeds');

  FFutureResOptional createFeed(FCreateFeedRequestDto createFeedDto) async {
    final responseData = await post('/create', data: createFeedDto.toJson());
    if (!responseData.isSuccess) {
      return FNullResOpt(responseData.resultCode);
    }

    return FResponseDto.tryToDto<FFeedDetailResponseDto>(responseData.data!.first);
  }

  FFutureResOptional myFeed(FMyFeedRequestDto myFeedDto) async {
    final responseData = await get('/my-feed', data: myFeedDto.toJson());
    if (!responseData.isSuccess) {
      return FNullResOpt(responseData.resultCode);
    }

    return FResponseDto.tryToDtoList<FFeedResponseDto>(responseData.data!);
  }

  FFutureResOptional todayHotFeeds(FSearchFeedRequestDto searchFeedDto) async {
    final responseData = await get('/today-hot', data: searchFeedDto.toJson());
    if (!responseData.isSuccess) {
      return FNullResOpt(responseData.resultCode);
    }

    return FResponseDto.tryToDtoList<FFeedResponseDto>(responseData.data!);
  }

  FFutureResOptional randomFeeds() async {
    final responseData = await get('/random');
    if (!responseData.isSuccess) {
      return FNullResOpt(responseData.resultCode);
    }

    return FResponseDto.tryToDtoList<FFeedResponseDto>(responseData.data!);
  }

  FFutureResOptional friendsFeeds() async {
    final responseData = await get('/friends');
    if (!responseData.isSuccess) {
      return FNullResOpt(responseData.resultCode);
    }

    return FResponseDto.tryToDtoList<FFeedResponseDto>(responseData.data!);
  }
}
