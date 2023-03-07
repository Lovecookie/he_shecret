import 'package:he_shecret/common/common_function.dart';
import 'package:he_shecret/models/user_feed_model.dart';
import 'package:he_shecret/provider/state_provider.dart';
import 'package:he_shecret/widgets/home/feed_widget.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeSubPage extends ConsumerWidget {
  const HomeSubPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(feedFutureProvider(0)).when(
      loading: () {
        return _body(isLoading: true);
      },
      error: (err, stack) {
        return _body(notCompletedText: "Error...");
      },
      data: (userFeeds) {
        return _body(userFeeds: userFeeds);
      },
    );
  }

  Widget _body({List<FUserFeedModel>? userFeeds, bool isLoading = false, String notCompletedText = ""}) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constrains) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constrains.maxWidth,
              minHeight: constrains.maxHeight,
            ),
            child: userFeeds != null
                ? _feedListView(userFeeds)
                : _emptyView(context: context, isLoading: isLoading, text: notCompletedText),
          );
        },
      ),
    );
  }

  Container _emptyView({
    required BuildContext context,
    required isLoading,
    required String text,
  }) {
    return Container(
      color: ownerColorScheme(context).primaryContainer.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          isLoading ? const CircularProgressIndicator() : Text(text),
        ],
      ),
    );
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
