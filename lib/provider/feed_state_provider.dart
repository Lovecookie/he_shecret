

// class FeedViewNotifier extends StateNotifier<List<FUserFeedModel>> {
//   FeedViewNotifier(super.state);

//   int get length => state.length;
//   bool get isEmpty => state.isEmpty;
//   List<FUserFeedModel>? get userFeeds => state;

//   void updateFeeds() async {
//     Future.delayed(const Duration(seconds: 2), () async {
//       final String response = await rootBundle.loadString('assets/json/userFeedTest.json');

//       Iterable iter = await json.decode(response);
//       state = List<FUserFeedModel>.from(iter.map((model) => FUserFeedModel.fromJson(model)));
//     });
//   }
// }