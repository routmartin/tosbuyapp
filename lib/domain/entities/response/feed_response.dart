class FeedResponse {
  final List<Feed> feeds;

  FeedResponse({required this.feeds});
}

class Feed {
  final int index;
  final bool isEnablePlay;
  final String url;

  Feed({required this.index, required this.isEnablePlay, required this.url});
}
