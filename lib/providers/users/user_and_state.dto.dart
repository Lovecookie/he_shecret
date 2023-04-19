import 'package:shipcret/providers/response_data.dart';

class FUserAndStateDto extends FResponseDto {
  final String useruuid;
  final String name;
  final String state;
  final DateTime lastActivateTime;
  final int myFriendCount;
  final int myBestFriendCount;

  const FUserAndStateDto({
    required this.useruuid,
    required this.name,
    required this.state,
    required this.lastActivateTime,
    required this.myFriendCount,
    required this.myBestFriendCount,
  });

  factory FUserAndStateDto.fromJson(Map<String, dynamic> json) {
    return FUserAndStateDto(
      useruuid: json['useruuid'],
      name: json['name'],
      state: json['state'],
      lastActivateTime: DateTime.parse(json['lastActivateTime']),
      myFriendCount: json['myFriendCount'],
      myBestFriendCount: json['myBestFriendCount'],
    );
  }

  @override
  List<Object?> get props => [useruuid, name, state, lastActivateTime, myFriendCount, myBestFriendCount];

  @override
  FRequestJson toJson() {
    return {
      'useruuid': useruuid,
      'name': name,
      'state': state,
      'lastActivateTime': lastActivateTime.toIso8601String(),
      'myFriendCount': myFriendCount,
      'myBestFriendCount': myBestFriendCount,
    };
  }
}
