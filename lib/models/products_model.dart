class Productss {
  final List<dynamic> products;

  Productss({required this.products});

  factory Productss.fromJson(Map<String, dynamic> jsonData) {
    return Productss(
      products: jsonData['products'],
    );
  }
}
