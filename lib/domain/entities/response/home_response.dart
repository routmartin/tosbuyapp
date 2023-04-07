class HomeResponse {
  final List<HomeData> items;

  HomeResponse({required this.items});
}

class HomeData {
  dynamic data;
  final HomeItemType type;

  HomeData({required this.data, required this.type});
}

enum HomeItemType {
  slider,
  choice,
  flashSale,
  products,
}
