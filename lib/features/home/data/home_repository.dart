// import 'package:dma_e_commerce/features/home/data/home_models.dart';

// class HomeRepository {

//   // ==========================
//   // CATEGORIES
//   // ==========================

//   Future<List<CategoryModel>> getCategories() async {
//     await Future.delayed(
//       const Duration(milliseconds: 300),
//     );

//     return const [
//       CategoryModel(
//         name: 'Fisheries',
//         imageUrl:
//             'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=300',
//       ),

//       CategoryModel(
//         name: 'Clothing',
//         imageUrl:
//             'https://images.unsplash.com/photo-1445205170230-053b83016050?w=300',
//       ),

//       CategoryModel(
//         name: 'Agriculture',
//         imageUrl:
//             'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=300',
//       ),

//       CategoryModel(
//         name: 'Electronics',
//         imageUrl:
//             'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=300',
//       ),

//       CategoryModel(
//         name: 'Machinery',
//         imageUrl:
//             'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=300',
//       ),

//       CategoryModel(
//         name: 'Food',
//         imageUrl:
//             'https://images.unsplash.com/photo-1542838132-92c53300491e?w=300',
//       ),

//       CategoryModel(
//         name: 'Home & Living',
//         imageUrl:
//             'https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=300',
//       ),
//     ];
//   }


//   // ==========================
//   // TODAY'S BEST DEALS
//   // ==========================

//   Future<List<DealModel>> getDeals() async {
//     await Future.delayed(
//       const Duration(milliseconds: 300),
//     );

//     return const [
//       DealModel(
//         name: 'Fresh Shrimp (Tiger)',
//         imageUrl:
//             'https://images.unsplash.com/photo-1565680018434-b513d5e5fd47?w=700',
//         price: 'BDT 950',
//         oldPrice: 'BDT 1,120',
//         discount: '15% OFF',
//         rating: 4.6,
//         reviews: 128,
//       ),

//       DealModel(
//         name: 'Premium Cotton Shirts',
//         imageUrl:
//             'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=700',
//         price: 'BDT 1,450',
//         oldPrice: 'BDT 1,810',
//         discount: '20% OFF',
//         rating: 4.7,
//         reviews: 96,
//       ),

//       DealModel(
//         name: 'Handmade Jute Handicraft',
//         imageUrl:
//             'https://images.unsplash.com/photo-1606722590583-6951b5ea92ad?w=700',
//         price: 'BDT 650',
//         oldPrice: 'BDT 800',
//         discount: '18% OFF',
//         rating: 4.8,
//         reviews: 74,
//       ),
//     ];
//   }


//   // ==========================
//   // FEATURED PRODUCTS
//   // ==========================

//   Future<List<FeaturedProductModel>>
//       getFeaturedProducts() async {

//     await Future.delayed(
//       const Duration(milliseconds: 300),
//     );

//     return const [

//       FeaturedProductModel(
//         name: 'Premium Bangladeshi Shrimp',
//         imageUrl:
//             'https://images.unsplash.com/photo-1565680018434-b513d5e5fd47?w=700',
//         price: 'BDT 950',
//         unit: '/ kg',
//         supplier: 'FreshSea Export Ltd.',
//         rating: 4.8,
//         tag: 'Top Export',
//       ),

//       FeaturedProductModel(
//         name: 'Premium Cotton Shirt',
//         imageUrl:
//             'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=700',
//         price: 'BDT 1,450',
//         unit: '/ piece',
//         supplier: 'Dhaka Apparel',
//         rating: 4.7,
//         tag: 'Verified',
//       ),

//       FeaturedProductModel(
//         name: 'Organic Fresh Vegetables',
//         imageUrl:
//             'https://images.unsplash.com/photo-1542838132-92c53300491e?w=700',
//         price: 'BDT 180',
//         unit: '/ kg',
//         supplier: 'Green Agro BD',
//         rating: 4.9,
//         tag: 'Organic',
//       ),

//       FeaturedProductModel(
//         name: 'Handmade Jute Products',
//         imageUrl:
//             'https://images.unsplash.com/photo-1606722590583-6951b5ea92ad?w=700',
//         price: 'BDT 650',
//         unit: '/ piece',
//         supplier: 'JuteCraft Bangladesh',
//         rating: 4.8,
//         tag: 'Export Ready',
//       ),
//     ];
//   }
// }

import 'package:dma_e_commerce/features/home/data/home_models.dart';

class HomeRepository {

  // ==========================
  // CATEGORIES
  // ==========================

  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return const [
      CategoryModel(
        name: 'Fisheries',
        imageUrl:
            'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=300',
      ),

      CategoryModel(
        name: 'Clothing',
        imageUrl:
            'https://images.unsplash.com/photo-1445205170230-053b83016050?w=300',
      ),

      CategoryModel(
        name: 'Agriculture',
        imageUrl:
            'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=300',
      ),

      CategoryModel(
        name: 'Electronics',
        imageUrl:
            'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=300',
      ),

      CategoryModel(
        name: 'Machinery',
        imageUrl:
            'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=300',
      ),

      CategoryModel(
        name: 'Food',
        imageUrl:
            'https://images.unsplash.com/photo-1542838132-92c53300491e?w=300',
      ),

      CategoryModel(
        name: 'Home & Living',
        imageUrl:
            'https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=300',
      ),
    ];
  }


  // ==========================
  // TODAY'S BEST DEALS
  // ==========================

  Future<List<DealModel>> getDeals() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return const [
      DealModel(
        name: 'Fresh Shrimp (Tiger)',
        imageUrl:
            'https://images.unsplash.com/photo-1565680018434-b513d5e5fd47?w=700',
        price: 'BDT 950',
        oldPrice: 'BDT 1,120',
        discount: '15% OFF',
        rating: 4.6,
        reviews: 128,
      ),

      DealModel(
        name: 'Premium Cotton Shirts',
        imageUrl:
            'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=700',
        price: 'BDT 1,450',
        oldPrice: 'BDT 1,810',
        discount: '20% OFF',
        rating: 4.7,
        reviews: 96,
      ),

      DealModel(
        name: 'Handmade Jute Handicraft',
        imageUrl:
            'https://images.unsplash.com/photo-1606722590583-6951b5ea92ad?w=700',
        price: 'BDT 650',
        oldPrice: 'BDT 800',
        discount: '18% OFF',
        rating: 4.8,
        reviews: 74,
      ),
    ];
  }


  // ==========================
  // FEATURED PRODUCTS
  // ==========================

  Future<List<FeaturedProductModel>>
      getFeaturedProducts() async {

    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return const [

      FeaturedProductModel(
        name: 'Premium Bangladeshi Shrimp',
        imageUrl:
            'https://images.unsplash.com/photo-1565680018434-b513d5e5fd47?w=700',
        price: 'BDT 950',
        unit: '/ kg',
        supplier: 'FreshSea Export Ltd.',
        rating: 4.8,
        tag: 'Top Export',
      ),

      FeaturedProductModel(
        name: 'Premium Cotton Shirt',
        imageUrl:
            'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=700',
        price: 'BDT 1,450',
        unit: '/ piece',
        supplier: 'Dhaka Apparel',
        rating: 4.7,
        tag: 'Verified',
      ),

      FeaturedProductModel(
        name: 'Organic Fresh Vegetables',
        imageUrl:
            'https://images.unsplash.com/photo-1542838132-92c53300491e?w=700',
        price: 'BDT 180',
        unit: '/ kg',
        supplier: 'Green Agro BD',
        rating: 4.9,
        tag: 'Organic',
      ),

      FeaturedProductModel(
        name: 'Handmade Jute Products',
        imageUrl:
            'https://images.unsplash.com/photo-1606722590583-6951b5ea92ad?w=700',
        price: 'BDT 650',
        unit: '/ piece',
        supplier: 'JuteCraft Bangladesh',
        rating: 4.8,
        tag: 'Export Ready',
      ),
    ];
  }


  // ==========================
  // TRADE OPPORTUNITIES
  // ==========================

  Future<List<TradeOpportunityModel>>
      getTradeOpportunities() async {

    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return const [

      TradeOpportunityModel(
        productName: 'Fresh Tiger Shrimp',
        buyerCountry: 'UAE',
        quantity: '500 KG',
        budget: 'BDT 900–1,000 / KG',
        category: 'Fisheries',
        flag: '🇦🇪',
        deadline: '3 days left',
      ),

      TradeOpportunityModel(
        productName: 'Premium Cotton Shirts',
        buyerCountry: 'Singapore',
        quantity: '1,000 Pieces',
        budget: 'BDT 1,200–1,500 / Piece',
        category: 'Clothing',
        flag: '🇸🇬',
        deadline: '5 days left',
      ),

      TradeOpportunityModel(
        productName: 'Organic Vegetables',
        buyerCountry: 'Saudi Arabia',
        quantity: '2,000 KG',
        budget: 'BDT 150–200 / KG',
        category: 'Agriculture',
        flag: '🇸🇦',
        deadline: '7 days left',
      ),

      TradeOpportunityModel(
        productName: 'Jute Shopping Bags',
        buyerCountry: 'Germany',
        quantity: '5,000 Pieces',
        budget: 'BDT 80–120 / Piece',
        category: 'Jute',
        flag: '🇩🇪',
        deadline: '6 days left',
      ),
    ];
  }
}