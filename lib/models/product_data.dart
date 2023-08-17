class ProductsData {
  final int id;
  final String title;
  final String description;
  final int price;
  final String thumbnail;

  ProductsData({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.thumbnail,
  });

  factory ProductsData.fromJson(
    Map<String, dynamic> e,
  ) {
    return ProductsData(
      id: e['id'],
      title: e['title'],
      description: e['description'],
      price: e['price'],
      thumbnail: e['thumbnail'],
    );
  }
}
