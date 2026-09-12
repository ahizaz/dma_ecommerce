// import 'package:dma_e_commerce/features/home/data/home_models.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../data/home_repository.dart';

// // ==========================
// // REPOSITORY PROVIDER
// // ==========================

// final homeRepositoryProvider =
//     Provider<HomeRepository>((ref) {

//   return HomeRepository();

// });

// // ==========================
// // HOME STATE
// // ==========================

// class HomeState {

//   final bool isLoading;

//   final List<CategoryModel> categories;

//   final List<DealModel> deals;

//   final List<FeaturedProductModel> featuredProducts;

//   final int selectedBottomIndex;

//   const HomeState({

//     this.isLoading = true,

//     this.categories = const [],

//     this.deals = const [],

//     this.featuredProducts = const [],

//     this.selectedBottomIndex = 0,

//   });

//   HomeState copyWith({

//     bool? isLoading,

//     List<CategoryModel>? categories,

//     List<DealModel>? deals,

//     List<FeaturedProductModel>? featuredProducts,

//     int? selectedBottomIndex,

//   }) {

//     return HomeState(

//       isLoading:
//           isLoading ?? this.isLoading,

//       categories:
//           categories ?? this.categories,

//       deals:
//           deals ?? this.deals,

//       featuredProducts:
//           featuredProducts ??
//               this.featuredProducts,

//       selectedBottomIndex:
//           selectedBottomIndex ??
//               this.selectedBottomIndex,

//     );
//   }
// }

// // ==========================
// // RIVERPOD PROVIDER
// // ==========================

// final homeProvider =
//     NotifierProvider<HomeNotifier, HomeState>(
//   HomeNotifier.new,
// );

// // ==========================
// // NOTIFIER
// // ==========================

// class HomeNotifier
//     extends Notifier<HomeState> {

//   late HomeRepository repository;

//   @override
//   HomeState build() {

//     repository =
//         ref.read(homeRepositoryProvider);

//     Future.microtask(
//       loadHome,
//     );

//     return const HomeState();
//   }

//   // ==========================
//   // LOAD HOME DATA
//   // ==========================

//   Future<void> loadHome() async {

//     state = state.copyWith(
//       isLoading: true,
//     );

//     final results = await Future.wait([

//       repository.getCategories(),

//       repository.getDeals(),

//       repository.getFeaturedProducts(),

//     ]);

//     state = state.copyWith(

//       isLoading: false,

//       categories:
//           results[0]
//               as List<CategoryModel>,

//       deals:
//           results[1]
//               as List<DealModel>,

//       featuredProducts:
//           results[2]
//               as List<FeaturedProductModel>,

//     );
//   }

//   // ==========================
//   // BOTTOM NAV
//   // ==========================

//   void changeBottomNav(
//       int index) {

//     state =
//         state.copyWith(
//       selectedBottomIndex: index,
//     );
//   }
// }

import 'package:dma_e_commerce/features/home/data/home_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/home_repository.dart';

// ==========================
// REPOSITORY PROVIDER
// ==========================

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});

// ==========================
// HOME STATE
// ==========================

class HomeState {
  final bool isLoading;

  final List<CategoryModel> categories;

  final List<DealModel> deals;

  final List<FeaturedProductModel> featuredProducts;

  final List<TradeOpportunityModel> tradeOpportunities;

  final List<FeaturedProductModel> cartProducts;

  final Map<String, int> cartQuantities;

  final Set<String> favoriteProducts;

  final int selectedBottomIndex;

  const HomeState({
    this.isLoading = true,

    this.categories = const [],

    this.deals = const [],

    this.featuredProducts = const [],

    this.tradeOpportunities = const [],

    this.cartProducts = const [],

    this.cartQuantities = const {},

    this.favoriteProducts = const {},

    this.selectedBottomIndex = 0,
  });

  HomeState copyWith({
    bool? isLoading,

    List<CategoryModel>? categories,

    List<DealModel>? deals,

    List<FeaturedProductModel>? featuredProducts,

    List<TradeOpportunityModel>? tradeOpportunities,

    List<FeaturedProductModel>? cartProducts,

    Map<String, int>? cartQuantities,

    Set<String>? favoriteProducts,

    int? selectedBottomIndex,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,

      categories: categories ?? this.categories,

      deals: deals ?? this.deals,

      featuredProducts: featuredProducts ?? this.featuredProducts,

      tradeOpportunities: tradeOpportunities ?? this.tradeOpportunities,

      cartProducts: cartProducts ?? this.cartProducts,

      cartQuantities: cartQuantities ?? this.cartQuantities,

      favoriteProducts: favoriteProducts ?? this.favoriteProducts,

      selectedBottomIndex: selectedBottomIndex ?? this.selectedBottomIndex,
    );
  }
}

// ==========================
// RIVERPOD PROVIDER
// ==========================

final homeProvider = NotifierProvider<HomeNotifier, HomeState>(
  HomeNotifier.new,
);

// ==========================
// NOTIFIER
// ==========================

class HomeNotifier extends Notifier<HomeState> {
  late HomeRepository repository;

  @override
  HomeState build() {
    repository = ref.read(homeRepositoryProvider);

    Future.microtask(loadHome);

    return const HomeState();
  }

  // ==========================
  // LOAD HOME DATA
  // ==========================

  Future<void> loadHome() async {
    state = state.copyWith(isLoading: true);

    final results = await Future.wait([
      repository.getCategories(),

      repository.getDeals(),

      repository.getFeaturedProducts(),

      repository.getTradeOpportunities(),
    ]);

    state = state.copyWith(
      isLoading: false,

      categories: results[0] as List<CategoryModel>,

      deals: results[1] as List<DealModel>,

      featuredProducts: results[2] as List<FeaturedProductModel>,

      tradeOpportunities: results[3] as List<TradeOpportunityModel>,
    );
  }

  // ==========================
  // BOTTOM NAV
  // ==========================

  void changeBottomNav(int index) {
    state = state.copyWith(selectedBottomIndex: index);
  }

  void addToCart(FeaturedProductModel product) {
    if (state.cartProducts.any((item) => item.name == product.name)) {
      increaseQuantity(product);
      return;
    }

    state = state.copyWith(
      cartProducts: [...state.cartProducts, product],
      cartQuantities: {...state.cartQuantities, product.name: 1},
    );
  }

  void addDealToCart(DealModel deal) {
    addToCart(
      FeaturedProductModel(
        name: deal.name,
        imageUrl: deal.imageUrl,
        price: deal.price,
        unit: '/ kg',
        supplier: 'Made in Bangladesh supplier',
        rating: deal.rating,
        tag: deal.discount,
      ),
    );
  }

  void toggleFavorite(String productName) {
    final favorites = {...state.favoriteProducts};
    if (!favorites.add(productName)) {
      favorites.remove(productName);
    }
    state = state.copyWith(favoriteProducts: favorites);
  }

  void increaseQuantity(FeaturedProductModel product) {
    state = state.copyWith(
      cartQuantities: {
        ...state.cartQuantities,
        product.name: (state.cartQuantities[product.name] ?? 1) + 1,
      },
    );
  }

  void decreaseQuantity(FeaturedProductModel product) {
    final quantity = state.cartQuantities[product.name] ?? 1;
    if (quantity <= 1) {
      removeFromCart(product);
      return;
    }

    state = state.copyWith(
      cartQuantities: {...state.cartQuantities, product.name: quantity - 1},
    );
  }

  void removeFromCart(FeaturedProductModel product) {
    state = state.copyWith(
      cartProducts: state.cartProducts
          .where((item) => item.name != product.name)
          .toList(),
      cartQuantities: Map<String, int>.from(state.cartQuantities)
        ..remove(product.name),
    );
  }

  void clearCart() {
    state = state.copyWith(cartProducts: const [], cartQuantities: const {});
  }
}
