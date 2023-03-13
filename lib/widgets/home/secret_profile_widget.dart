import 'package:shipcret/common/common_assets.dart';
import 'package:shipcret/common/common_font.dart';
import 'package:shipcret/common/widgets/background_image_widget.dart';
import 'package:shipcret/material-theme/common_color.dart';
import 'package:shipcret/models/secret_feed_model.dart';
import 'package:shipcret/models/shipcret_profile_model.dart';
import 'package:shipcret/widgets/common/common_string.dart';
import 'package:shipcret/widgets/common/shipcret_profile_card_widget.dart';

import 'package:flutter/material.dart';

class FSecretProfileWidget extends StatefulWidget {
  final FSecretFeedModel secretFeedModel;
  final double height;

  const FSecretProfileWidget({super.key, required this.secretFeedModel, this.height = 200.0});

  @override
  State<FSecretProfileWidget> createState() => _FSecretProfileWidgetState();
}

class _FSecretProfileWidgetState extends State<FSecretProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    var generateJson = FSecretProfileModel.generateRandomData();

    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(color: FCommonColor.godic),
      child: Column(
        children: <Widget>[
          FSecretProfileCardWidget(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              imageUrl: FCommonAssets.randomImageAssets(),
              profileModel: FSecretProfileModel.fromJson(generateJson[0])),
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
    );
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
              fontSize: 10.0,
            )),
      ],
    );
  }
}
