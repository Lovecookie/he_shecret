import 'package:shipcret/models/secret_feed_model.dart';
import 'package:flutter/material.dart';

class FSecretFeedWidget extends StatelessWidget {
  final FSecretFeedModel userFeedModel;

  const FSecretFeedWidget({super.key, required this.userFeedModel});

  @override
  Widget build(BuildContext context) {
    return _feedNameBar();
  }

  Widget _feedNameBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(userFeedModel.profileImageUrl),
              radius: 20.0,
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  userFeedModel.secretTitle,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userFeedModel.secretContent,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Icon(Icons.more_vert),
      ],
    );
  }
}
