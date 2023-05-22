import 'package:shipcret/common/common_font.dart';
import 'package:shipcret/common/widgets/background_image_widget.dart';
import 'package:shipcret/material-theme/common_color.dart';
import 'package:shipcret/models/shipcret_profile_model.dart';
import 'package:shipcret/widgets/common/icon_button.dart';

import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutter/material.dart';

class FSecretProfileCardWidget extends StatefulWidget {
  final FSecretProfileModel profileModel;
  final String imageUrl;
  final double width;
  final double height;

  const FSecretProfileCardWidget(
      {super.key, required this.imageUrl, required this.profileModel, required this.width, required this.height});

  @override
  State<FSecretProfileCardWidget> createState() => _ShipcrettProfilWidgeteState();
}

class _ShipcrettProfilWidgeteState extends State<FSecretProfileCardWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FBackgroundStackBlurWidget(
      image: AssetImage(widget.imageUrl),
      width: widget.width,
      height: widget.height,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(35.0),
        bottomRight: Radius.circular(35.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _profileImage(),
          Text(
            widget.profileModel.nickName,
            style: TextStyle(
              color: FCommonColor.godicOpacity(0.8),
              fontFamily: FCommonFont.family,
              fontSize: 18.0,
              height: 2.0,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _profileImage() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(widget.imageUrl), fit: BoxFit.cover),
      ),
    );
  }

  FIconButton _heartIconButton() {
    return FIconButton(
      isBackground: true,
      icon: const Icon(
        FontAwesome5.heart,
        size: 18.0,
        color: FCommonColor.heart,
      ),
      selectedIcon: const Icon(
        FontAwesome5.heart,
        size: 18.0,
        color: FCommonColor.heartSelected,
      ),
      onPressed: () {},
    );
  }

  FIconButton _commentsIconButton() {
    return FIconButton(
      isBackground: true,
      icon: Icon(
        FontAwesome5.comment_alt,
        size: 18.0,
        color: FCommonColor.commentsIcon,
      ),
      onPressed: () {},
    );
  }
}
