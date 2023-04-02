import 'package:shipcret/providers/repository_base.dart';
import 'package:shipcret/providers/dio_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class FUserRepository extends FRepositoryBase {
  FUserRepository(Ref ref) : super(ref, contentDioProvider, 'users');

  static final provider = Provider<FUserRepository>((ref) {
    return FUserRepository(ref);
  });

  Future<FResponseData> getUserInfo(BigInt useruuid) async {
    final responseData = await get('/get-info', data: {'useruuid': useruuid.toString()});
    checkResponse(responseData);

    return responseData;
  }
}
