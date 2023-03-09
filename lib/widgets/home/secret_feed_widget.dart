import 'package:shipcret/common/widgets/cached_image_widget.dart';
import 'package:shipcret/models/secret_feed_model.dart';

import 'package:flutter/material.dart';

class FSecretFeedWidget extends StatefulWidget {
  final FSecretFeedModel secretFeedModel;
  final double height;

  const FSecretFeedWidget({super.key, required this.secretFeedModel, this.height = 200.0});

  @override
  State<FSecretFeedWidget> createState() => _FSecretFeedWidgetState();
}

class _FSecretFeedWidgetState extends State<FSecretFeedWidget> {
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

// color: const Color.fromARGB(255, 246, 200, 187),
  Widget _body(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color.fromARGB(255, 246, 200, 187),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        width: 100.0,
        height: widget.height,
        child: Column(
          children: <Widget>[
            _feedNameBar(),
          ],
        ));
  }

  Widget _feedNameBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      width: double.infinity,
      height: 55,
      child: Row(
        children: <Widget>[
          FCachedImageWidget(
            url: widget.secretFeedModel.profileImage,
            width: 45,
            height: 45,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 13.0,
                  color: Colors.grey.shade400,
                ),
                Container(
                  width: 50.0,
                  height: 10.0,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
