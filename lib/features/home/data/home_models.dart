// class CategoryModel {
//   final String name;
//   final String imageUrl;

//   const CategoryModel({
//     required this.name,
//     required this.imageUrl,
//   });
// }


// // ==========================
// // DEAL MODEL
// // ==========================

// class DealModel {
//   final String name;
//   final String imageUrl;
//   final String price;
//   final String oldPrice;
//   final String discount;
//   final double rating;
//   final int reviews;

//   const DealModel({
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.oldPrice,
//     required this.discount,
//     required this.rating,
//     required this.reviews,
//   });
// }


// // ==========================
// // FEATURED PRODUCT MODEL
// // ==========================

// class FeaturedProductModel {
//   final String name;
//   final String imageUrl;
//   final String price;
//   final String unit;
//   final String supplier;
//   final double rating;
//   final String tag;

//   const FeaturedProductModel({
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.unit,
//     required this.supplier,
//     required this.rating,
//     required this.tag,
//   });
// }

class CategoryModel {
  final String name;
  final String imageUrl;

  const CategoryModel({
    required this.name,
    required this.imageUrl,
  });
}


// ==========================
// DEAL MODEL
// ==========================

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


// ==========================
// FEATURED PRODUCT MODEL
// ==========================

class FeaturedProductModel {
  final String name;
  final String imageUrl;
  final String price;
  final String unit;
  final String supplier;
  final double rating;
  final String tag;

  const FeaturedProductModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.unit,
    required this.supplier,
    required this.rating,
    required this.tag,
  });
}


// ==========================
// TRADE OPPORTUNITY MODEL
// ==========================

class TradeOpportunityModel {
  final String productName;
  final String buyerCountry;
  final String quantity;
  final String budget;
  final String category;
  final String flag;
  final String deadline;

  const TradeOpportunityModel({
    required this.productName,
    required this.buyerCountry,
    required this.quantity,
    required this.budget,
    required this.category,
    required this.flag,
    required this.deadline,
  });
}