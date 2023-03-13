import 'package:shipcret/common/common_font.dart';
import 'package:shipcret/common/common_ui_overlay_style.dart';
import 'package:shipcret/material-theme/common_color.dart';
import 'package:shipcret/models/secret_feed_model.dart';
import 'package:shipcret/provider/state_provider.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shipcret/widgets/home/feed_widget_view.dart';

class HomeSubPage extends ConsumerWidget {
  const HomeSubPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FCommonUIOverlayStyle.topStateBar(color: FCommonColor.godic);

    return ref.watch(secretFeedFutureProvider(0)).when(
      loading: () {
        return _body(context, isLoading: true);
      },
      error: (err, stack) {
        return _body(context, notCompletedText: "Error...");
      },
      data: (secretFeeds) {
        return _body(context, secretFeeds: secretFeeds);
      },
    );
  }

  Widget _body(
    BuildContext context, {
    List<FSecretFeedModel>? secretFeeds,
    bool isLoading = false,
    String notCompletedText = "",
  }) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) {
        return Container(
          color: FCommonColor.godic,
          constraints: BoxConstraints(
            minWidth: constrains.maxWidth,
            minHeight: constrains.maxHeight,
          ),
          child: secretFeeds != null
              ? FFeedWidgetView(secretFeeds) // _feedListView(secretFeeds, context: context)
              : _emptyView(context: context, isLoading: isLoading, text: notCompletedText),
        );
      },
    );
  }

  Container _emptyView({
    required BuildContext context,
    required isLoading,
    required String text,
  }) {
    return Container(
      color: FCommonColor.godic,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          isLoading
              ? const CircularProgressIndicator()
              : Text(
                  text,
                  style: const TextStyle(color: FCommonColor.subPrimaryWhite, fontFamily: FCommonFont.family),
                ),
        ],
      ),
    );
  }
}
