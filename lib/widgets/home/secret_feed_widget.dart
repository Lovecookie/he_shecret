import 'package:shipcret/common/common_assets.dart';
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
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            _feedNameBar(context),
          ],
        ));
  }

  Widget _feedNameBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      color: const Color.fromARGB(255, 184, 194, 199),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _profileImage(),
        ],
      ),
    );
  }

  Widget _profileImage() {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.amber,
        shape: BoxShape.circle,
        // DecorationImage(image: widget.image, fit: BoxFit.cover),
        image: DecorationImage(image: AssetImage(FCommonAssets.dreamShip1), fit: BoxFit.cover),
      ),
    );
  }
}
