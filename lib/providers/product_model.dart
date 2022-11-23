class ProductModel {
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final String rating;
  final String reviews;

  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.reviews,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      price: json['price'].toString(),
      title: json['title'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating']['rate'].toString(),
      reviews: json['rating']['count'].toString(),
    );
  }
}
