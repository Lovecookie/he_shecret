import 'dart:ffi';

import 'package:shipcret/providers/response_data.dart';

class FFindUserRequestDto extends FRequestDtoBase {
  final Int64 useruuid;

  const FFindUserRequestDto({
    required this.useruuid,
  });

  @override
  List<Object?> get props => [useruuid];

  factory FFindUserRequestDto.fromJson(Map<String, dynamic> json) => FFindUserRequestDto(
        useruuid: json["useruuid"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "useruuid": useruuid,
      };
}
