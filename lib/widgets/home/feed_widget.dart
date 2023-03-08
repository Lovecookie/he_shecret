import 'package:shipcret/common/common_font.dart';
import 'package:shipcret/common/widgets/custom_snack_bar.dart';
import 'package:shipcret/models/user_feed_model.dart';
import 'package:shipcret/widgets/common/common_icon_button.dart';
import 'package:shipcret/widgets/common/common_string.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class FFeedWidget extends ConsumerWidget {
  late FUserFeedModel userFeedModel;
  late double height;

  FFeedWidget({super.key, required this.userFeedModel, this.height = 300.0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrange.shade100,
        border: Border.all(
          color: const Color.fromARGB(255, 136, 41, 12),
          width: 0.5,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _feedNameBar(),
          _feedContentView(),
          _feedBottomBar(context),
        ],
      ),
    );
  }

  Widget _feedBottomBar(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FIconButton.createFeedWidgetIcon(
            onPressed: () {
              FCustomSnackBar.floatingSnackBar(context, FCommonString.recommendedIt);
            },
            icon: const Icon(Icons.thumb_up_alt_outlined),
            selectedIcon: const Icon(Icons.thumb_up_alt_rounded),
          ),
          FIconButton.createFeedWidgetIcon(
            onPressed: () {
              FCustomSnackBar.floatingSnackBar(context, FCommonString.didNotRecommendedIt);
            },
            icon: const Icon(Icons.thumb_down_alt_outlined),
            selectedIcon: const Icon(Icons.thumb_down_alt_rounded),
          ),
          FIconButton.createFeedWidgetIcon(
            onPressed: () {
              FCustomSnackBar.floatingSnackBar(context, FCommonString.sentCupOfCoffee);
            },
            icon: const Icon(Icons.free_breakfast_outlined),
            selectedIcon: const Icon(Icons.free_breakfast_rounded),
          ),
          FIconButton.createFeedWidgetIcon(
            onPressed: () {
              FCustomSnackBar.floatingSnackBar(context, FCommonString.recommendedHot);
            },
            icon: const Icon(Icons.local_fire_department_outlined),
            selectedIcon: const Icon(Icons.local_fire_department_rounded),
          ),
        ],
      ),
    );
  }

  Widget _feedContentView() {
    String cutMessage = _cutMessage();

    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 5.0),
          Text(cutMessage),
        ],
      ),
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
            userFeedModel.profileImage,
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

  String _cutMessage() {
    if (255 < userFeedModel.secretMessage.length) {
      const String added = ' ......(continue)';

      var result = userFeedModel.secretMessage.substring(0, 255);
      return result + added;
    }

    return userFeedModel.secretMessage;
  }
}
