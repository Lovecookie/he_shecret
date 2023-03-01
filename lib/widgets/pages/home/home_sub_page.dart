import 'package:he_shecret/common/common_function.dart';
import 'package:he_shecret/models/user_feed_model.dart';
import 'package:he_shecret/provider/state_provider.dart';
import 'package:he_shecret/widgets/feed_box/feed_widget.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeSubPage extends HookConsumerWidget {
  const HomeSubPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final List<int> feeds = [1, 2, 3, 4, 5, 6, 7, 8];

    return ref.watch(feedFutureProvider(0)).when(
      loading: () {
        return _body(notCompletedText: "Loading...");
      },
      error: (err, stack) {
        return _body(notCompletedText: "Error...");
      },
      data: (userFeeds) {
        return _body(userFeeds: userFeeds);
      },
    );
  }

  Widget _body({List<FUserFeedModel>? userFeeds, String notCompletedText = ""}) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constrains) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constrains.maxWidth,
              minHeight: constrains.maxHeight,
            ),
            child: notCompletedText == ""
                ? _feedListView(userFeeds!)
                : _emptyView(context: context, text: notCompletedText),
          );
        },
      ),
    );
  }

  Container _emptyView({
    required BuildContext context,
    required String text,
  }) {
    return Container(
      color: ownerColorScheme(context).primaryContainer.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(text),
        ],
      ),
    );
    // return SingleChildScrollView(
    //     child: ConstrainedBox(
    //         constraints: BoxConstraints(
    //           minWidth: constrains.maxWidth,
    //           minHeight: constrains.maxHeight,
    //         ),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: const <Widget>[

    //           ],
    //         )));
  }

  CustomScrollView _feedListView(List<FUserFeedModel> userFeeds) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return FFeedWidget(
                userFeedModel: userFeeds[index],
              );
            },
            childCount: userFeeds.length,
          ),
        ),
      ],
    );
  }
}
