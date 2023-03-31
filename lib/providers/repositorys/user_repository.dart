import 'package:shipcret/providers/repositorys/repository_base.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dio_provider.dart';

class FUserRepository extends FRepositoryBase {
  FUserRepository(Ref ref) : super(ref, shipcretDioProvider, 'users');

  static final provider = Provider<FUserRepository>((ref) {
    return FUserRepository(ref);
  });

  Future<FResponseData> getUserInfo(BigInt useruuid) async {
    final responseData = await get('/get-info', data: {'useruuid': useruuid.toString()});
    if (!responseData.isSuccess) {
      debugPrint('❗❗❗❗❗❗❗❗❗❗❗ error: ${responseData.error} ❗❗❗❗❗❗❗❗❗❗❗');
    }

    return responseData;
  }
}
