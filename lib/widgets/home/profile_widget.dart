import 'package:shipcret/common/common_assets.dart';
import 'package:shipcret/common/common_font.dart';
import 'package:shipcret/common/widgets/background_image_widget.dart';
import 'package:shipcret/material-theme/common_color.dart';
import 'package:shipcret/providers/entitys/user_profile.entity.dart';
import 'package:shipcret/providers/users/user.provider.dart';
import 'package:shipcret/widgets/common/common_string.dart';
import 'package:shipcret/widgets/common/profile_card_widget.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class FProfilePage extends ConsumerStatefulWidget {
  final double height;

  const FProfilePage({super.key, this.height = 200.0});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FProfilePageState();
}

class _FProfilePageState extends ConsumerState<FProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(myUserFutureProvider(false)).when(
      loading: () {
        return _body(FUserProfileEntity.empty());
      },
      error: (err, stack) {
        return _body(FUserProfileEntity.empty());
      },
      data: (optional) {
        if (!optional.hasValue) {
          return _body(FUserProfileEntity.empty());
        }

        final FMyUserInfo myUserInfo = optional.value;
        ref.read(myUserInfoProvider).setUserInfo(myUserInfo.userEntity, myUserInfo.userProfileEntity);

        return _body(myUserInfo.userProfileEntity);
      },
    );
  }

  Widget _body(FUserProfileEntity profileEntity) {
    // var generateJson = FSecretProfileModel.generateRandomData();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: FCommonColor.mattBlack),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(color: FCommonColor.godic),
          child: Column(
            children: <Widget>[
              FProfileCardWidget(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                profileEntity: profileEntity,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: FCommonColor.mattBlack,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _infoText("250K", FCommonString.follower),
                      _infoText("1000", FCommonString.secretCount),
                      _infoText("100", FCommonString.uncoveredCount),
                    ]),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return _thumbnailBoxRow();
                  },
                ),
              )
            ],
          ),
        ));
  }

  Row _thumbnailBoxRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _userSecretThumbnailBox(),
        _userSecretThumbnailBox(),
        _userSecretThumbnailBox(),
        _userSecretThumbnailBox(),
      ],
    );
  }

  Container _userSecretThumbnailBox() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: FBackgroundImageWidget(
        width: 90.0,
        height: 90.0,
        borderRadius: BorderRadius.circular(15.0),
        image: AssetImage(FCommonAssets.randomImageAssets()),
      ),
    );
  }

  Widget _infoText(String count, String info) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(count,
            style: const TextStyle(
                color: FCommonColor.subPrimaryWhite,
                fontFamily: FCommonFont.family,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
        Text(info,
            style: const TextStyle(
              color: FCommonColor.subPrimaryWhite,
              fontFamily: FCommonFont.family,
              fontSize: 15.0,
            )),
      ],
    );
  }
}
