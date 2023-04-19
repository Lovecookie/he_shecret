import 'package:shipcret/common/utils/util.dart';
import 'package:shipcret/providers/response_data.dart';
import 'package:shipcret/providers/users/find_user.requestDto.dart';
import 'package:shipcret/providers/users/user_and_state.dto.dart';
import 'package:shipcret/providers/repository_base.dart';
import 'package:shipcret/providers/dio_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepository = Provider<FUserRepository>((ref) {
  return FUserRepository(ref);
});

class FUserRepository extends FRepositoryBase {
  FUserRepository(Ref ref) : super(ref, contentDioProvider, 'users');

  FFutureResOptional findUser(FFindUserRequestDto getUserInfoDto) async {
    final responseData = await get('/find-user', data: getUserInfoDto.toJson());
    if (!responseData.isSuccess) {
      return FNullResOpt(responseData.resultCode);
    }

    return FResponseDto.tryToDto<FUserAndStateDto>(responseData.data!.first);
  }

  FFutureResOptional myInfo() async {
    final responseData = await get('/my-info');
    if (!responseData.isSuccess) {
      return FNullResOpt(responseData.resultCode);
    }

    return FResponseDto.tryToDto<FUserAndStateDto>(responseData.data!.first);
  }
}
