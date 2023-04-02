import 'package:shipcret/providers/entitys/entity_base.dart';

class FAuthTokenEntity extends FEntityBase {
  final String accessToken;
  final String refreshToken;

  const FAuthTokenEntity({
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [accessToken, refreshToken];

  @override
  FRequestJson toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
