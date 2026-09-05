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

final homeRepositoryProvider =
    Provider<HomeRepository>((ref) {

  return HomeRepository();

});


// ==========================
// HOME STATE
// ==========================

class HomeState {

  final bool isLoading;

  final List<CategoryModel> categories;

  final List<DealModel> deals;

  final List<FeaturedProductModel>
      featuredProducts;

  final List<TradeOpportunityModel>
      tradeOpportunities;

  final int selectedBottomIndex;


  const HomeState({

    this.isLoading = true,

    this.categories = const [],

    this.deals = const [],

    this.featuredProducts = const [],

    this.tradeOpportunities = const [],

    this.selectedBottomIndex = 0,

  });


  HomeState copyWith({

    bool? isLoading,

    List<CategoryModel>? categories,

    List<DealModel>? deals,

    List<FeaturedProductModel>?
        featuredProducts,

    List<TradeOpportunityModel>?
        tradeOpportunities,

    int? selectedBottomIndex,

  }) {

    return HomeState(

      isLoading:
          isLoading ?? this.isLoading,

      categories:
          categories ?? this.categories,

      deals:
          deals ?? this.deals,

      featuredProducts:
          featuredProducts ??
              this.featuredProducts,

      tradeOpportunities:
          tradeOpportunities ??
              this.tradeOpportunities,

      selectedBottomIndex:
          selectedBottomIndex ??
              this.selectedBottomIndex,

    );
  }
}


// ==========================
// RIVERPOD PROVIDER
// ==========================

final homeProvider =
    NotifierProvider<HomeNotifier, HomeState>(
  HomeNotifier.new,
);


// ==========================
// NOTIFIER
// ==========================

class HomeNotifier
    extends Notifier<HomeState> {

  late HomeRepository repository;


  @override
  HomeState build() {

    repository =
        ref.read(homeRepositoryProvider);

    Future.microtask(
      loadHome,
    );

    return const HomeState();
  }


  // ==========================
  // LOAD HOME DATA
  // ==========================

  Future<void> loadHome() async {

    state = state.copyWith(
      isLoading: true,
    );


    final results = await Future.wait([

      repository.getCategories(),

      repository.getDeals(),

      repository.getFeaturedProducts(),

      repository.getTradeOpportunities(),

    ]);


    state = state.copyWith(

      isLoading: false,

      categories:
          results[0]
              as List<CategoryModel>,

      deals:
          results[1]
              as List<DealModel>,

      featuredProducts:
          results[2]
              as List<FeaturedProductModel>,

      tradeOpportunities:
          results[3]
              as List<TradeOpportunityModel>,

    );
  }


  // ==========================
  // BOTTOM NAV
  // ==========================

  void changeBottomNav(
      int index) {

    state =
        state.copyWith(
      selectedBottomIndex: index,
    );
  }
}