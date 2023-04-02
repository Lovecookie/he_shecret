import 'package:equatable/equatable.dart';

typedef FRequestJson = Map<String, dynamic>;

abstract class FEntityBase extends Equatable {
  const FEntityBase();

  FRequestJson toJson();
}
