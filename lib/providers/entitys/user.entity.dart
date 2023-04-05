
import 'package:fixnum/fixnum.dart';

import 'package:equatable/equatable.dart';
import 'package:shipcret/providers/users/user_and_state.dto.dart';

// ignore: must_be_immutable
class FUserEntity extends Equatable {
  Int64 useruuid;
  String name;
  String state;
  late DateTime lastActivateTime;
  int myFriendCount;
  int myBestFriendCount;
  // List<Int64>? myFriends;
  // List<Int64>? myBestFriends;
  // String? email;
  // String? displayName;
  // String? profilePic;
  // String? bannerImage;
  // String? contact;
  // String? location;

  FUserEntity({
    this.useruuid = Int64.ZERO,
    this.name = '',
    this.state = '',
    DateTime? activateTime,
    this.myFriendCount = 0,
    this.myBestFriendCount = 0,
    // this.myFriends,
    // this.myBestFriends,
    // this.email,
    // this.displayName,
    // this.profilePic,
    // this.bannerImage,
    // this.contact,
    // this.location,
  }) : lastActivateTime = activateTime ?? DateTime.now();

  @override
  List<Object?> get props => [
        useruuid,
        name,
        state,
        lastActivateTime,
        myFriendCount,
        myBestFriendCount,
        // myFriends,
        // myBestFriends,
        // email,
        // displayName,
        // profilePic,
        // bannerImage,
        // contact,
        // location,
      ];

  factory FUserEntity.fromJson(FUserAndStateDto userAndStateDto) {
    return FUserEntity(
      useruuid: Int64.parseInt(userAndStateDto.useruuid),
      name: userAndStateDto.name,
      state: userAndStateDto.state,
      activateTime: userAndStateDto.lastActivateTime,
      myFriendCount: userAndStateDto.myFriendCount,
      myBestFriendCount: userAndStateDto.myBestFriendCount,
      // myFriends: userAndStateDto.myFriendCount,
      // myBestFriends: userAndStateDto.myBestFriends,
      // email: userAndStateDto.email,
      // displayName: userAndStateDto.displayName,
      // profilePic: userAndStateDto.profilePic,
      // bannerImage: userAndStateDto.bannerImage,
      // contact: userAndStateDto.contact,
      // location: userAndStateDto.location,
    );
  }
}
