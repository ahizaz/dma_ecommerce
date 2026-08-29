class CategoryModel {
  final String name;
  final String imageUrl;

  const CategoryModel({
    required this.name,
    required this.imageUrl,
  });
}

class DealModel {
  final String name;
  final String imageUrl;
  final String price;
  final String oldPrice;
  final String discount;
  final double rating;
  final int reviews;

  const DealModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
  });
}