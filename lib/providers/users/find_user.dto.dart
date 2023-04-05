import 'dart:ffi';

import 'package:shipcret/providers/response_data.dart';

class FFindUserDto extends FRequestDtoBase {
  final Int64 useruuid;

  const FFindUserDto({
    required this.useruuid,
  });

  @override
  List<Object?> get props => [useruuid];

  factory FFindUserDto.fromJson(Map<String, dynamic> json) => FFindUserDto(
        useruuid: json["useruuid"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "useruuid": useruuid,
      };
}
