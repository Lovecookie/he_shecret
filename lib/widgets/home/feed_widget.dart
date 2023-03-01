import 'package:he_shecret/common/common_enum.dart';
import 'package:he_shecret/common/common_font.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:he_shecret/models/user_feed_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class FFeedWidget extends ConsumerWidget {
  late FUserFeedModel userFeedModel;
  late double height;

  FFeedWidget({super.key, required this.userFeedModel, this.height = 300.0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (userFeedModel.feedContentType) {
      case EFeedContentType.none:
      case EFeedContentType.content:
        {
          height = 300;
        }
        break;
      case EFeedContentType.image:
      case EFeedContentType.video:
        {
          height = 500;
        }
        break;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.lightBlue.shade200,
          width: 0.5,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: height,
      child: Column(
        children: <Widget>[
          _feedNameBar(),
          _feedContentView(),
        ],
      ),
    );
  }

  String _cutMessage() {
    if (255 < userFeedModel.secretMessage.length) {
      const String added = ' ......';

      var result = userFeedModel.secretMessage.substring(0, 255);
      return result + added;
    }

    return userFeedModel.secretMessage;
  }

  Widget _feedContentView() {
    String cutMessage = _cutMessage();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 5,
        ),
        Text(cutMessage),
        Container(
          // alignment: Alignment.bottomCenter,
          height: 100.0,
          color: Colors.lightBlue.shade100,
        )
      ],
    );
  }

  Widget _feedNameBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      width: double.infinity,
      height: 45,
      child: Row(
        children: <Widget>[
          _simpleImageIcon(
            userFeedModel.profileImage, // FCommonUrl.picsumRandom,
            width: 35,
            height: 35,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  userFeedModel.displayName,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontFamily: FCommonFont.family,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  userFeedModel.userTag,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 10,
                    fontFamily: FCommonFont.family,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CachedNetworkImage _simpleImageIcon(
    String url, {
    int? width,
    int? height,
  }) {
    return CachedNetworkImage(
      memCacheWidth: width ?? 50,
      memCacheHeight: height ?? 50,
      imageUrl: url,
      fadeInDuration: const Duration(milliseconds: 100),
      fadeOutDuration: const Duration(milliseconds: 100),
      imageBuilder: (context, imageProvider) => Container(
        width: width != null ? width.toDouble() : 50.0,
        height: height != null ? height.toDouble() : 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider, // colorFilter: ColorFilter.mode(Colors.pink.shade200, BlendMode.colorBurn),
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.people_alt_rounded),
    );
  }
}
